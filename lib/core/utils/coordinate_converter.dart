// lib/core/utils/coordinate_converter.dart
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart'; // GridXY를 위해 추가
import 'package:weather_angel/core/error/failures.dart';

/// 기상청 API에 사용되는 격자 좌표 (nx, ny) - LocationPoint와 역할이 유사
class GridXY extends Equatable {
  final int x;
  final int y;

  const GridXY(this.x, this.y);

  @override
  List<Object?> get props => [x, y];

  @override
  bool get stringify => true;
}

/// 좌표 변환을 위한 추상 클래스
abstract class CoordinateConverter {
  /// 주어진 위도와 경도를 격자 좌표(GridXY)로 변환합니다.
  Either<Failure, GridXY> convertToGrid(double latitude, double longitude);
}

class KmaLccDfsCoordinateConverterImpl implements CoordinateConverter {
  // 기상청 LCC DFS 격자 변환을 위한 상수들
  static const double _RE = 6371.00877; // 지구 반지름 (km)
  static const double _GRID = 5.0; // 격자 간격 (km)
  static const double _SLAT1 = 30.0; // 표준 위도 1
  static const double _SLAT2 = 60.0; // 표준 위도 2
  static const double _OLON = 126.0; // 기준점 경도
  static const double _OLAT = 38.0; // 기준점 위도
  static const double _XO = 43; // 기준점 X 좌표 (기상청 DFS_XY_CONV 기준)
  static const double _YO = 136; // 기준점 Y 좌표 (기상청 DFS_XY_CONV 기준)
  static const double _DEGRAD = pi / 180.0;

  @override
  Either<Failure, GridXY> convertToGrid(double lat, double lon) {
    // --- 입력 값 유효성 검사 추가 ---
    if (lat < -90.0 || lat > 90.0) {
      return Left(InvalidInputFailure('위도 값($lat)은 -90.0과 90.0 사이여야 합니다.'));
    }
    if (lon < -180.0 || lon > 180.0) {
      return Left(InvalidInputFailure('경도 값($lon)은 -180.0과 180.0 사이여야 합니다.'));
    }
    try {
      double re = _RE / _GRID;
      double slat1 = _SLAT1 * _DEGRAD;
      double slat2 = _SLAT2 * _DEGRAD;
      double olon = _OLON * _DEGRAD;
      double olat = _OLAT * _DEGRAD;

      double sn = tan(pi * 0.25 + slat2 * 0.5) / tan(pi * 0.25 + slat1 * 0.5);
      sn = log(cos(slat1) / cos(slat2)) / log(sn);
      double sf = tan(pi * 0.25 + slat1 * 0.5);
      sf = pow(sf, sn) * cos(slat1) / sn;
      double ro = tan(pi * 0.25 + olat * 0.5);
      ro = re * sf / pow(ro, sn);

      double ra = tan(pi * 0.25 + lat * _DEGRAD * 0.5);
      ra = re * sf / pow(ra, sn);
      double theta = lon * _DEGRAD - olon;
      if (theta > pi) theta -= 2.0 * pi;
      if (theta < -pi) theta += 2.0 * pi;
      theta *= sn;

      int x = (ra * sin(theta) + _XO + 0.5).floor();
      int y = (ro - ra * cos(theta) + _YO + 0.5).floor();
      if (x.isNaN || y.isNaN || x.isInfinite || y.isInfinite) {
        return Left(
          CoordinateConversionFailure('좌표 변환 중 수학적 오류 발생 (NaN 또는 Infinity)'),
        );
      }
      return Right(GridXY(x, y));
    } catch (e) {
      return Left(
        CoordinateConversionFailure('좌표 변환 중 예상치 못한 오류 발생: ${e.toString()}'),
      );
    }
  }
}

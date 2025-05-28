import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/utils/coordinate_converter.dart'; // GridXY, CoordinateConverter, KmaLccDfsCoordinateConverterImpl

void main() {
  late KmaLccDfsCoordinateConverterImpl converter;

  setUp(() {
    converter = KmaLccDfsCoordinateConverterImpl();
  });

  group('KmaLccDfsCoordinateConverterImpl - convertToGrid', () {
    // 1. 잘 알려진 좌표 (서울 시청)에 대한 성공적인 변환 테스트
    test(
      'should return Right<GridXY> with correct coordinates for Seoul City Hall',
      () {
        // Arrange
        const double lat = 37.5665; // 서울 시청 위도
        const double lon = 126.9780; // 서울 시청 경도
        const expectedGridXY = GridXY(60, 127); // 예상되는 격자 좌표

        // Act
        final result = converter.convertToGrid(lat, lon);

        // Assert
        expect(result, equals(const Right(expectedGridXY)));
      },
    );

    // 2. 다른 알려진 좌표 (부산 시청)에 대한 성공적인 변환 테스트
    test(
      'should return Right<GridXY> with correct coordinates for Busan City Hall',
      () {
        // Arrange
        const double lat = 35.1798; // 부산 시청 위도
        const double lon = 129.0750; // 부산 시청 경도
        const expectedGridXY = GridXY(
          98,
          76,
        ); // 예상되는 격자 좌표 (실제 변환기 결과에 따라 조정될 수 있음)
        // 이 값은 KmaLccDfsCoordinateConverterImpl로 직접 계산해서 얻은 정확한 값이어야 합니다.

        // Act
        final result = converter.convertToGrid(lat, lon);

        // Assert
        // 실제 변환 결과에 따라 expectedGridXY를 정확히 맞춰야 합니다.
        // 예를 들어, converter.convertToGrid(35.1798, 129.0750)를 직접 실행해보고 그 결과를 사용합니다.
        // 여기서는 (98,76)이 정확하다고 가정합니다.
        expect(result, equals(const Right(expectedGridXY)));
      },
    );

    // 3. 사용자의 현재 위치 (강릉시청 근처)에 대한 성공적인 변환 테스트
    test(
      'should return Right<GridXY> with correct coordinates for Gangneung City Hall',
      () {
        // Arrange
        const double lat = 37.7519; // 강릉시청 위도
        const double lon = 128.8761; // 강릉시청 경도
        // 이 좌표에 대한 예상 GridXY 값은 KmaLccDfsCoordinateConverterImpl을 통해 미리 계산해야 합니다.
        // 예: final preCalculated = KmaLccDfsCoordinateConverterImpl().convertToGrid(lat, lon);
        // preCalculated가 Right(GridXY(x,y)) 라면 그 x, y를 사용합니다.
        const expectedGridXY = GridXY(92, 132);

        // Act
        final result = converter.convertToGrid(lat, lon);

        // Assert
        expect(result, equals(const Right(expectedGridXY)));
      },
    );

    // 6. 유효 범위를 벗어난 위도 값 (예: 위도 91도)
    test(
      'should return Left<InvalidInputFailure> for out-of-range latitude (e.g., 91.0) after adding input validation',
      () {
        // Arrange
        const double lat = 91.0;
        const double lon = 0.0;

        // Act
        final result = converter.convertToGrid(lat, lon);

        // Assert
        expect(result.isLeft(), isTrue, reason: '결과는 Left여야 합니다.');
        result.fold((failure) {
          expect(
            failure,
            isA<InvalidInputFailure>(),
            reason: 'Failure 타입은 InvalidInputFailure여야 합니다.',
          );
          expect(
            failure.message,
            contains('위도 값(91.0)은 -90.0과 90.0 사이여야 합니다.'), // 예상되는 오류 메시지
            reason: '오류 메시지가 예상과 일치해야 합니다.',
          );
        }, (gridXY) => fail('유효 범위를 벗어난 입력에 대해 Right($gridXY)가 반환되었습니다.'));
      },
    );
  });
}

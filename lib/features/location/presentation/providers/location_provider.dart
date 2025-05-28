import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_angel/core/usecase.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/usecases/get_location.dart';

/// 위치 정보 상태를 나타냅니다 (AsyncValue 사용).
typedef LocationState = AsyncValue<PositionEntity>;

/// 위치 정보를 가져오고 상태를 관리하는 StateNotifier 입니다.
class LocationNotifier extends StateNotifier<LocationState> {
  final GetLocation _getLocationUseCase;

  LocationNotifier(this._getLocationUseCase)
    : super(const AsyncValue.loading()) {
    // Notifier 생성 시 초기 위치 정보를 가져올 수 있습니다.
    // 또는, 사용자의 특정 액션에 따라 fetchCurrentLocation을 호출할 수도 있습니다.
    // 예: fetchCurrentLocation(); // 앱 시작 시 또는 필요 시 자동 호출
  }

  /// 현재 위치 정보를 비동기적으로 가져와 상태를 업데이트합니다.
  Future<void> fetchCurrentLocation() async {
    state = const AsyncValue.loading(); // 로딩 상태로 설정
    final result = await _getLocationUseCase(NoParams()); // 유스케이스 실행

    result.fold(
      (failure) =>
          state = AsyncValue.error(failure, StackTrace.current), // 실패 시 에러 상태
      (position) => state = AsyncValue.data(position), // 성공 시 데이터 상태
    );
  }
}

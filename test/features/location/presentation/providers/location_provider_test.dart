import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // AsyncValue를 위해
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/usecase.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/usecases/get_location.dart';
import 'package:weather_angel/features/location/presentation/providers/location_provider.dart'; // LocationNotifier와 LocationState(AsyncValue)

// GetLocation 유스케이스 Mock 생성을 위한 어노테이션
@GenerateNiceMocks([MockSpec<GetLocation>()])
import 'location_provider_test.mocks.dart'; // 생성될 mock 파일

void main() {
  late LocationNotifier notifier;
  late MockGetLocation mockGetLocation;

  setUp(() {
    // 각 테스트 전에 mock 객체와 notifier를 초기화합니다.
    mockGetLocation = MockGetLocation();
    notifier = LocationNotifier(mockGetLocation);
  });

  // 테스트에 사용될 데이터 정의
  const tLatitude = 37.5665;
  const tLongitude = 126.9780;
  const tPositionEntity = PositionEntity(
    latitude: tLatitude,
    longitude: tLongitude,
  );
  const tLocationFailure = LocationFailure('위치 정보를 가져오는 데 실패했습니다.');
  final tNoParams = NoParams(); // 유스케이스 호출 시 사용

  test('initial state should be AsyncValue.loading', () {
    // Assert (검증)
    // LocationNotifier 생성자의 super(const AsyncValue.loading()) 호출 확인
    expect(notifier.state, const AsyncValue<PositionEntity>.loading());
  });

  group('fetchCurrentLocation', () {
    test(
      'should update state to [AsyncLoading, AsyncData] when GetLocation use case is successful',
      () async {
        // Arrange (준비)
        // GetLocation 유스케이스가 성공적으로 PositionEntity를 반환하도록 설정
        when(
          mockGetLocation(tNoParams),
        ).thenAnswer((_) async => const Right(tPositionEntity));

        // Act (실행)
        // fetchCurrentLocation 메소드를 호출합니다.
        // notifier.state는 초기에 AsyncValue.loading() 입니다.
        // fetchCurrentLocation 내부에서 다시 state = AsyncValue.loading()으로 설정 후,
        // 최종적으로 AsyncValue.data() 또는 AsyncValue.error()로 변경됩니다.
        // 여기서는 최종 상태만 검증합니다.
        // 상태 변화를 모두 추적하려면 ProviderContainer와 listener를 사용할 수 있습니다.
        final call = notifier.fetchCurrentLocation();

        // Assert (검증) - 상태 변화 확인
        // 1. 호출 직후 (메소드 내부 첫 줄에서 다시 로딩 상태로 설정)
        // 이 시점의 상태를 직접 확인하기는 어렵지만, 로직상 로딩으로 시작됨을 인지합니다.
        // 아래는 메소드 완료 후 최종 상태를 검증합니다.
        expect(
          notifier.state,
          const AsyncValue<PositionEntity>.loading(),
          reason: "호출 시작 시 로딩 상태여야 함",
        );

        await call; // 비동기 호출 완료 대기

        // 2. GetLocation 유스케이스가 한 번 호출되었는지 확인
        verify(mockGetLocation(tNoParams));
        // 3. 최종 상태가 AsyncValue.data(tPositionEntity)인지 확인
        expect(notifier.state, const AsyncValue.data(tPositionEntity));
        // 4. 더 이상 mockGetLocation과의 상호작용이 없는지 확인
        verifyNoMoreInteractions(mockGetLocation);
      },
    );

    test(
      'should update state to [AsyncLoading, AsyncError] when GetLocation use case fails',
      () async {
        // Arrange (준비)
        // GetLocation 유스케이스가 Failure를 반환하도록 설정
        when(
          mockGetLocation(tNoParams),
        ).thenAnswer((_) async => const Left(tLocationFailure));

        // Act (실행)
        final call = notifier.fetchCurrentLocation();

        // Assert (검증) - 상태 변화 확인
        expect(
          notifier.state,
          const AsyncValue<PositionEntity>.loading(),
          reason: "호출 시작 시 로딩 상태여야 함",
        );

        await call; // 비동기 호출 완료 대기

        // 2. GetLocation 유스케이스가 한 번 호출되었는지 확인
        verify(mockGetLocation(tNoParams));
        // 3. 최종 상태가 AsyncValue.error(tLocationFailure)인지 확인
        // AsyncValue.error는 error 객체와 StackTrace를 받습니다.
        // StackTrace는 실제 실행 시점에 따라 달라지므로, error 객체만 비교하거나 isA<AsyncError>로 확인합니다.
        expect(notifier.state.hasError, isTrue);
        expect(notifier.state.error, tLocationFailure);
        // 또는 더 정확하게:
        // expect(notifier.state, AsyncValue<PositionEntity>.error(tLocationFailure, any)); // any는 StackTrace를 의미
        // 4. 더 이상 mockGetLocation과의 상호작용이 없는지 확인
        verifyNoMoreInteractions(mockGetLocation);
      },
    );
  });
}

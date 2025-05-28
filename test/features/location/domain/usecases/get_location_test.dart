import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/usecase.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/repositories/location_repository.dart';
import 'package:weather_angel/features/location/domain/usecases/get_location.dart';

// MockLocationRepository 클래스 생성을 위한 어노테이션
@GenerateNiceMocks([MockSpec<LocationRepository>()])
import 'get_location_test.mocks.dart'; // 생성될 mock 파일

void main() {
  late GetLocation usecase;
  late MockLocationRepository mockLocationRepository;

  setUp(() {
    // 각 테스트 전에 mock 객체와 usecase를 초기화합니다.
    mockLocationRepository = MockLocationRepository();
    usecase = GetLocation(mockLocationRepository);
  });

  // 테스트에 사용될 PositionEntity 객체
  const tLatitude = 37.7749;
  const tLongitude = -122.4194;
  const tPositionEntity = PositionEntity(
    latitude: tLatitude,
    longitude: tLongitude,
  );

  // 테스트에 사용될 Failure 객체
  const tLocationFailure = LocationFailure('위치 정보를 가져오는 데 실패했습니다.');

  test(
    'should get current position from the repository when successful',
    () async {
      // Arrange (준비)
      // LocationRepository의 getLocation 메소드가 성공적으로 PositionEntity를 반환하도록 설정합니다.
      when(
        mockLocationRepository.getLocation(),
      ).thenAnswer((_) async => const Right(tPositionEntity));

      // Act (실행)
      // GetLocation 유스케이스를 실행합니다. (NoParams 인스턴스 전달)
      final result = await usecase(NoParams());

      // Assert (검증)
      // 결과가 예상된 Right(PositionEntity)와 일치하는지 확인합니다.
      expect(result, const Right(tPositionEntity));
      // LocationRepository의 getLocation 메소드가 한 번 호출되었는지 확인합니다.
      verify(mockLocationRepository.getLocation());
      // 더 이상 mockLocationRepository와의 상호작용이 없는지 확인합니다.
      verifyNoMoreInteractions(mockLocationRepository);
    },
  );

  test(
    'should return Failure from the repository when getting current position fails',
    () async {
      // Arrange (준비)
      // LocationRepository의 getLocation 메소드가 Failure를 반환하도록 설정합니다.
      when(
        mockLocationRepository.getLocation(),
      ).thenAnswer((_) async => const Left(tLocationFailure));

      // Act (실행)
      // GetLocation 유스케이스를 실행합니다.
      final result = await usecase(NoParams());

      // Assert (검증)
      // 결과가 예상된 Left(Failure)와 일치하는지 확인합니다.
      expect(result, const Left(tLocationFailure));
      // LocationRepository의 getLocation 메소드가 한 번 호출되었는지 확인합니다.
      verify(mockLocationRepository.getLocation());
      // 더 이상 mockLocationRepository와의 상호작용이 없는지 확인합니다.
      verifyNoMoreInteractions(mockLocationRepository);
    },
  );
}

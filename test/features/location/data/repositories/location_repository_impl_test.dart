import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/location/data/datasources/location_remote_data_source.dart';
import 'package:weather_angel/features/location/data/models/position_model.dart';
import 'package:weather_angel/features/location/data/repositories/location_repository_impl.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';

// MockLocationRemoteDataSource 클래스 생성을 위한 어노테이션
@GenerateNiceMocks([MockSpec<LocationRemoteDataSource>()])
import 'location_repository_impl_test.mocks.dart'; // 생성될 mock 파일

void main() {
  late LocationRepositoryImpl repository;
  late MockLocationRemoteDataSource mockRemoteDataSource;

  setUp(() {
    // 각 테스트 전에 mock 객체와 repository를 초기화합니다.
    mockRemoteDataSource = MockLocationRemoteDataSource();
    repository = LocationRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  // 테스트에 사용될 데이터 정의
  const tLatitude = 37.5665;
  const tLongitude = 126.9780;

  const tPositionModel = PositionModel(
    latitude: tLatitude,
    longitude: tLongitude,
  );
  // PositionModel의 toEntity()가 올바르게 작동한다고 가정
  final tPositionEntity = tPositionModel.toEntity();

  group('getLocation', () {
    test(
      'should return PositionEntity when remote data source is successful',
      () async {
        // Arrange (준비)
        // remoteDataSource.getCurrentPositionFromDevice()가 성공적으로 PositionModel을 반환하도록 설정
        when(
          mockRemoteDataSource.getCurrentPositionFromDevice(),
        ).thenAnswer((_) async => tPositionModel);

        // Act (실행)
        final result = await repository.getLocation();

        // Assert (검증)
        // remoteDataSource의 getCurrentPositionFromDevice 메소드가 한 번 호출되었는지 확인
        verify(mockRemoteDataSource.getCurrentPositionFromDevice());
        // 결과가 예상된 Right(PositionEntity)와 일치하는지 확인
        expect(result, equals(Right(tPositionEntity)));
        // 더 이상 mockRemoteDataSource와의 상호작용이 없는지 확인
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return LocationFailure when remote data source throws LocationServiceException',
      () async {
        // Arrange (준비)
        const exceptionMessage = 'Location services are disabled.';
        when(
          mockRemoteDataSource.getCurrentPositionFromDevice(),
        ).thenThrow(const LocationServiceException(exceptionMessage));

        // Act (실행)
        final result = await repository.getLocation();

        // Assert (검증)
        verify(mockRemoteDataSource.getCurrentPositionFromDevice());
        expect(result, equals(const Left(LocationFailure(exceptionMessage))));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return LocationFailure when remote data source throws LocationPermissionException',
      () async {
        // Arrange (준비)
        const exceptionMessage = 'Location permissions are denied.';
        when(
          mockRemoteDataSource.getCurrentPositionFromDevice(),
        ).thenThrow(const LocationPermissionException(exceptionMessage));

        // Act (실행)
        final result = await repository.getLocation();

        // Assert (검증)
        verify(mockRemoteDataSource.getCurrentPositionFromDevice());
        expect(result, equals(const Left(LocationFailure(exceptionMessage))));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return LocationFailure when remote data source throws DeviceLocationException',
      () async {
        // Arrange (준비)
        const exceptionMessage = 'Failed to get location: Timeout.';
        when(
          mockRemoteDataSource.getCurrentPositionFromDevice(),
        ).thenThrow(const DeviceLocationException(exceptionMessage));

        // Act (실행)
        final result = await repository.getLocation();

        // Assert (검증)
        verify(mockRemoteDataSource.getCurrentPositionFromDevice());
        expect(result, equals(const Left(LocationFailure(exceptionMessage))));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return LocationFailure with a generic message for other unhandled exceptions from data source',
      () async {
        // Arrange (준비)
        final tGenericException = Exception('Something went wrong');
        when(
          mockRemoteDataSource.getCurrentPositionFromDevice(),
        ).thenThrow(tGenericException);

        // Act (실행)
        final result = await repository.getLocation();

        // Assert (검증)
        verify(mockRemoteDataSource.getCurrentPositionFromDevice());
        // Repository의 catch-all 블록에서 생성하는 메시지 확인
        expect(
          result,
          equals(
            Left(
              LocationFailure(
                '위치 저장소에서 예상치 못한 오류 발생: ${tGenericException.toString()}',
              ),
            ),
          ),
        );
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );
  });
}

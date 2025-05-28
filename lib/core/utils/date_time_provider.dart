// lib/core/utils/date_time_provider.dart

abstract class DateTimeProvider {
  /// 현재 로컬 시간을 반환합니다.
  DateTime get now;

  /// 현재 UTC 시간을 반환합니다.
  DateTime get utcNow;
}

class DateTimeProviderImpl implements DateTimeProvider {
  @override
  DateTime get now => DateTime.now();

  @override
  DateTime get utcNow => DateTime.now().toUtc();
}

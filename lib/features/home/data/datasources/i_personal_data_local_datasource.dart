import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';

abstract class IPersonalDataLocalDatasource {
  /// Gets PersonalInfo
  /// Throws [CacheException] if no personal info is found
  Future<PersonalInfo> getPersonalInfo();
}

import '../../domain/entities/personal_info.dart';
import '../../domain/entities/skill.dart';

abstract class IPersonalDataLocalDatasource {
  Future<PersonalInfo> getPersonalInfo();

  Future<List<Skill>> getSkills();
}

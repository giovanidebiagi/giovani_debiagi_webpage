import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';

abstract class IPersonalDataLocalDatasource {
  Future<PersonalInfo> getPersonalInfo();

  Future<List<Skill>> getSkills();
}

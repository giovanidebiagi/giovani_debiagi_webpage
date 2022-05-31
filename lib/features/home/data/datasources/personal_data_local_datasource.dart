import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/features/home/data/datasources/i_personal_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';

class PersonalDataLocalDatasource implements IPersonalDataLocalDatasource {
  @override
  Future<PersonalInfo> getPersonalInfo() async {
    try {
      return const PersonalInfo(
        name: PERSONAL_INFO_NAME,
        lastName: PERSONAL_INFO_LAST_NAME,
        email: PERSONAL_INFO_EMAIL,
        about: PERSONAL_INFO_ABOUT,
        gitHubUrl: PERSONAL_INFO_GIT_HUB_URL,
        linkedInUrl: PERSONAL_INFO_LINKED_IN_URL,
        youTubeUrl: PERSONAL_YOU_TUBE_URL,
        profilePictureAssetPath: PERSONAL_INFO_PROFILE_PICTURE_PATH,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<Skill>> getSkills() async {
    List<Skill> _skills = [];

    try {
      SKILLS.forEach(
          (k, v) => _skills.add(Skill(name: k, skillIconAssetPath: v)));

      return _skills;
    } catch (e) {
      throw CacheException();
    }
  }
}

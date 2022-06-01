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
        name: PersonalInfoConstants.personalInfoName,
        lastName: PersonalInfoConstants.personalInfoLastName,
        email: PersonalInfoConstants.personalInfoEmail,
        about: PersonalInfoConstants.personalInfoAboutMeDescription,
        gitHubUrl: PersonalInfoConstants.personalInfoGitHubUrl,
        linkedInUrl: PersonalInfoConstants.personalInfoLinkedInUrl,
        youTubeUrl: PersonalInfoConstants.personalYouTubeUrl,
        profilePictureAssetPath:
            PersonalInfoConstants.personalInfoProfilePicturePath,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<Skill>> getSkills() async {
    List<Skill> _skills = [];

    try {
      PersonalInfoConstants.skills.forEach(
          (k, v) => _skills.add(Skill(name: k, skillIconAssetPath: v)));

      return _skills;
    } catch (e) {
      throw CacheException();
    }
  }
}

import '../../../../core/data/personal_info_constants.dart';
import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../domain/entities/personal_info.dart';
import '../../domain/entities/skill.dart';
import 'i_personal_data_local_datasource.dart';

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

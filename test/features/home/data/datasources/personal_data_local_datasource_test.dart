import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/features/home/data/datasources/personal_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';

void main() {
  late PersonalDataLocalDatasource _personalDataLocalDatasource;

  setUp(() {
    _personalDataLocalDatasource = PersonalDataLocalDatasource();
  });

  test('should return [PersonalInfo] when fetching is successful', () async {
    // arrange
    const _personalInfo = PersonalInfo(
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

    // act
    final _result = await _personalDataLocalDatasource.getPersonalInfo();

    // assert
    expect(_result, _personalInfo);
  });

  test('should return [List<Skills>] when fetching is successful', () async {
    // arrange
    List<Skill> _skills = [];
    PersonalInfoConstants.skills
        .forEach((k, v) => _skills.add(Skill(name: k, skillIconAssetPath: v)));

    // act
    final _result = await _personalDataLocalDatasource.getSkills();

    // assert
    expect(_result, _skills);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/data/datasources/i_personal_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';
import 'package:giovani_debiagi_webpage/features/home/data/repositories/personal_data_repository.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonalDataLocalDatasource extends Mock
    implements IPersonalDataLocalDatasource {}

void main() {
  late MockPersonalDataLocalDatasource _mockPersonalDataLocalDatasource;
  late PersonalDataRepository _personalDataRepository;

  setUp(() {
    _mockPersonalDataLocalDatasource = MockPersonalDataLocalDatasource();
    _personalDataRepository = PersonalDataRepository(
        personalDataLocalDatasource: _mockPersonalDataLocalDatasource);
  });

  group('get personal info', () {
    test(
        'should return personal info when local datasource fetching is successful',
        () async {
      // arrange
      const _personalInfo = PersonalInfo(
        name: PERSONAL_INFO_NAME,
        lastName: PERSONAL_INFO_LAST_NAME,
        email: PERSONAL_INFO_EMAIL,
        about: PERSONAL_INFO_ABOUT,
        gitHubUrl: PERSONAL_INFO_GIT_HUB_URL,
        linkedInUrl: PERSONAL_INFO_LINKED_IN_URL,
        youTubeUrl: PERSONAL_YOU_TUBE_URL,
        profilePictureAssetPath: PERSONAL_INFO_PROFILE_PICTURE_PATH,
      );

      when(() => _mockPersonalDataLocalDatasource.getPersonalInfo())
          .thenAnswer((invocation) async => _personalInfo);

      // act
      final _result = await _personalDataRepository.getPersonalInfo();

      // assert
      expect(_result, const Right(_personalInfo));
    });

    test(
        'should return [CacheFailure] local datasource fetching is not successful',
        () async {
      // arrange
      when(() => _mockPersonalDataLocalDatasource.getPersonalInfo())
          .thenThrow(CacheException());

      // act
      final _result = await _personalDataRepository.getPersonalInfo();

      // assert
      expect(_result, Left(CacheFailure()));
    });
  });

  group('get skills', () {
    test(
        'should return list of personal skills when datasource fetching is successful',
        () async {
      // arrange
      List<Skill> _skills = [];

      SKILLS.forEach(
          (k, v) => _skills.add(Skill(name: k, skillIconAssetPath: v)));
      when(() => _mockPersonalDataLocalDatasource.getSkills())
          .thenAnswer((invocation) async => _skills);

      // act
      final _result = await _personalDataRepository.getSkills();

      // assert
      expect(_result, Right(_skills));
    });

    test(
        'should return [CacheFailure] local datasource fetching is not successful',
        () async {
      when(() => _mockPersonalDataLocalDatasource.getSkills())
          .thenThrow(CacheException());

      // act
      final _result = await _personalDataRepository.getSkills();

      // assert
      expect(_result, Left(CacheFailure()));
    });
  });
}

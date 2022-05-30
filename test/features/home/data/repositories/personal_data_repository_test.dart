import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/data/datasources/i_personal_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/home/data/personal_info_constants.dart';
import 'package:giovani_debiagi_webpage/features/home/data/repositories/personal_data_repository.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
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

  final _personalInfo = PersonalInfo(
    name: PERSONAL_INFO_NAME,
    lastName: PERSONAL_INFO_LAST_NAME,
    email: PERSONAL_INFO_EMAIL,
    about: PERSONAL_INFO_ABOUT,
    gitHubUrl: PERSONAL_INFO_GIT_HUB_URL,
    linkedInUrl: PERSONAL_INFO_LINKED_IN_URL,
    youTubeUrl: PERSONAL_YOU_TUBE_URL,
  );

  test(
      'should return personal info when local datasource fetching is successful',
      () async {
    // arrange
    when(() => _mockPersonalDataLocalDatasource.getPersonalInfo())
        .thenAnswer((invocation) async => _personalInfo);

    // act
    final _result = await _personalDataRepository.getPersonalInfo();

    // assert
    expect(_result, Right(_personalInfo));
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
}

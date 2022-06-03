import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/repositories/i_personal_data_repository.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/usecases/get_skills.dart';
import 'package:mocktail/mocktail.dart';

class MockPersonalDataRepository extends Mock
    implements IPersonalDataRepository {}

void main() {
  late MockPersonalDataRepository _mockPersonalDataRepository;
  late GetSkills _getSkills;

  setUp(() {
    _mockPersonalDataRepository = MockPersonalDataRepository();
    _getSkills = GetSkills(repository: _mockPersonalDataRepository);
  });

  test('should return [CacheFailure] when getting skills is not successful',
      () async {
    // arrange
    when(() => _mockPersonalDataRepository.getSkills())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // act
    final _result = await _getSkills();

    // assert
    verify(() => _mockPersonalDataRepository.getSkills());
    expect(_result, Left(CacheFailure()));
    verifyNoMoreInteractions(_mockPersonalDataRepository);
  });

  test('should return skills list when getting skills is successful', () async {
    // arrange
    final _skillsList = List<Skill>.generate(
      8,
      (index) => Skill(
        name: 'Skill $index',
        skillIconAssetPath: '/skill/$index/asset/path',
      ),
    );

    when(() => _mockPersonalDataRepository.getSkills())
        .thenAnswer((invocation) async => Right(_skillsList));

    // act
    final _result = await _getSkills();

    // assert
    verify(() => _mockPersonalDataRepository.getSkills());
    expect(_result, Right(_skillsList));
    verifyNoMoreInteractions(_mockPersonalDataRepository);
  });
}

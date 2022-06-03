import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/usecases/get_skills.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/get_skills_bloc.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_events/get_skills_event.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/empty_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/error_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/loaded_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/loading_skills_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSkills extends Mock implements GetSkills {}

void main() {
  late MockGetSkills _mockGetSkills;
  late GetSkillsBloc _getSkillsBloc;

  setUp(() {
    _mockGetSkills = MockGetSkills();
    _getSkillsBloc = GetSkillsBloc(getSkillsUsecase: _mockGetSkills);
  });

  test('should emit [EmptySkillsState] when bloc starts', () {
    expect(_getSkillsBloc.initialState, isA<EmptySkillsState>());
  });

  final GetSkillsEvent _getSkillsEvent = GetSkillsEvent();

  final _skillsList = List<Skill>.generate(
    8,
    (index) => Skill(
      name: 'Skill $index',
      skillIconAssetPath: '/skill/$index/asset/path',
    ),
  );

  void _setUpGetSkillsReturnSkillsListSuccess() {
    when(() => _mockGetSkills())
        .thenAnswer((invocation) async => Right(_skillsList));
  }

  test('should call GetSkills call() method', () async {
    // arrange
    _setUpGetSkillsReturnSkillsListSuccess();

    // act
    _getSkillsBloc.add(_getSkillsEvent);
    await untilCalled(() => _mockGetSkills());

    // assert
    verify(() => _mockGetSkills());
  });

  test(
      'should emit [LoadingSkillsState] and then [ErrorSkillsState] when getting skills is unsuccessful',
      () async {
    // arrange
    when(() => _mockGetSkills())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // assert later
    expectLater(_getSkillsBloc.stream,
        emitsInOrder([LoadingSkillsState(), ErrorSkillsState()]));

    // act
    _getSkillsBloc.add(GetSkillsEvent());
    await untilCalled(() => _mockGetSkills());
  });

  test('''should emit [LoadingSkillsState] and then [LoadedSkillsState] 
  with _skillsList when getting skills is successful''', () async {
    // arrange
    _setUpGetSkillsReturnSkillsListSuccess();

    // assert later
    expectLater(
        _getSkillsBloc.stream,
        emitsInOrder(
            [LoadingSkillsState(), LoadedSkillsState(skills: _skillsList)]));

    // act
    _getSkillsBloc.add(GetSkillsEvent());
    await untilCalled(() => _mockGetSkills());
  });
}

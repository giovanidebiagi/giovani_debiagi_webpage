import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/usecases/get_mechatronics_projects.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/get_mechatronics_projects_bloc.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/mechatronics_projects_events/get_mechatronics_projects_event.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/mechatronics_projects_states/empty_mechatronics_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/mechatronics_projects_states/error_mechatronics_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/mechatronics_projects_states/loaded_mechatronics_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/presentation/blocs/mechatronics_projects_states/loading_mechatronics_projects_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMechatronicsProjects extends Mock implements GetMechatronicsProjects {}

void main() {
  late MockGetMechatronicsProjects _mockGetMechatronicsProjects;
  late GetMechatronicsProjectsBloc _getMechatronicsProjectsBloc;

  setUp(() {
    _mockGetMechatronicsProjects = MockGetMechatronicsProjects();
    _getMechatronicsProjectsBloc =
        GetMechatronicsProjectsBloc(getMechatronicsBlocUsecase: _mockGetMechatronicsProjects);
  });

  late List<MechatronicsProject> _mechatronicsProjectsList;

  void _setUpSuccessfulCallToGetMechatronicsProjectUsecase({required bool notEmpty}) {
    if (notEmpty) {
      final List<String> _mechatronicsProjectImagesPaths =
          List<String>.generate(8, (index) => '/path/to/mechatronics/project/image/$index');
      _mechatronicsProjectsList = List<MechatronicsProject>.generate(
        8,
        (index) => MechatronicsProject(
            name: 'Mechatronics Project $index',
            description:
                "Quadrotor Control by Teleoperation Using IMU is a project developed during my Mechatronics Engineering undegraduation.\nThe system consists of a Control Glove, a Decision Making Unit (Ubuntu Linux running ROS) and an Unmanned Aerial Vehicle.\nBy using it, the user is able to maneuver a drone vehicle with their hand movements.\n\nSupport: FAPESP (Process: 2016/04117-8)\nLabRom - EESC-USP",
            projectImagesPaths: _mechatronicsProjectImagesPaths,
            videosUrl:
                'https://www.youtube.com/watch?v=Fp48DxE-20k&list=PLMFvLxnk4aiLag7BGHFrbJRXZ1Vu9WAT1'),
      );
    } else {
      _mechatronicsProjectsList = [];
    }

    when(() => _mockGetMechatronicsProjects())
        .thenAnswer((invocation) async => Right(_mechatronicsProjectsList));
  }

  test('should emit LoadingMechatronicsProjectsState on bloc init', () {
    // arrange

    // act

    // assert
    expect(_getMechatronicsProjectsBloc.initialState, const LoadingMechatronicsProjectsState());
  });

  test('should call GetMechatronicsProjectsBloc call method', () async {
    // arrange
    _setUpSuccessfulCallToGetMechatronicsProjectUsecase(notEmpty: true);

    // act
    _getMechatronicsProjectsBloc.add(GetMechatronicsProjectsEvent());
    await untilCalled(() => _mockGetMechatronicsProjects());

    // assert
    verify(() => _mockGetMechatronicsProjects());
  });

  test('''should emit [ErrorMechatronicsProjectsState]
  when getting mechatronics projects is not successful''', () async {
    // arrange
    when(() => _mockGetMechatronicsProjects())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // assert later
    expectLater(_getMechatronicsProjectsBloc.stream, emits(ErrorMechatronicsProjectsState()));

    // act
    _getMechatronicsProjectsBloc.add(GetMechatronicsProjectsEvent());
    await untilCalled(() => _mockGetMechatronicsProjects());
  });

  test('''should emit [LoadedMechatronicsProjects] with 
      _mechatronicsProjectsList when getting projects is successful and projects list is not empty''',
      () async {
    // arrange
    _setUpSuccessfulCallToGetMechatronicsProjectUsecase(notEmpty: true);

    // assert later
    expectLater(
      _getMechatronicsProjectsBloc.stream,
      emits(LoadedMechatronicsProjectsState(mechatronicsProjects: _mechatronicsProjectsList)),
    );

    // act
    _getMechatronicsProjectsBloc.add(GetMechatronicsProjectsEvent());
    await untilCalled(() => _mockGetMechatronicsProjects());
  });

  test(
      '''should emit [EmptyMechatronicsProjectsState] when getting projects is successful and projects list is empty''',
      () async {
    // arrange
    _setUpSuccessfulCallToGetMechatronicsProjectUsecase(notEmpty: false);

    // assert later
    expectLater(_getMechatronicsProjectsBloc.stream, emits(const EmptyMechatronicsProjectsState()));

    // act
    _getMechatronicsProjectsBloc.add(GetMechatronicsProjectsEvent());
    await untilCalled(() => _mockGetMechatronicsProjects());
  });
}

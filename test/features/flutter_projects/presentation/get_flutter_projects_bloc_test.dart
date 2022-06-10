import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/usecases/get_flutter_projects.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/flutter_projects_events/get_flutter_projects_event.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/flutter_projects_states/empty_flutter_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/flutter_projects_states/error_flutter_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/flutter_projects_states/loaded_flutter_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/flutter_projects_states/loading_flutter_projects_state.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/get_flutter_projects_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetFlutterProjects extends Mock implements GetFlutterProjects {}

void main() {
  late MockGetFlutterProjects _mockGetFlutterProjects;
  late GetFlutterProjectsBloc _getFlutterProjectsBloc;

  setUp(() {
    _mockGetFlutterProjects = MockGetFlutterProjects();
    _getFlutterProjectsBloc =
        GetFlutterProjectsBloc(getFlutterBlocUsecase: _mockGetFlutterProjects);
  });

  late List<FlutterProject> _flutterProjectsList;

  void _setUpSuccessfulCallToGetFlutterProjectUsecase() {
    final List<String> _flutterProjectImagesPaths = List<String>.generate(
        8, (index) => '/path/to/flutter/project/image/$index');
    _flutterProjectsList = List<FlutterProject>.generate(
      8,
      (index) => FlutterProject(
        name: 'Flutter Project $index',
        description:
            '''This app was developed for an engineering company based in Brazil.
It allows company’s clients to access data and documents related to their contracted services.
It also provides a tax simulator.''',
        projectImagesPaths: _flutterProjectImagesPaths,
      ),
    );

    when(() => _mockGetFlutterProjects())
        .thenAnswer((invocation) async => Right(_flutterProjectsList));
  }

  test('should emit EmptyFlutterProjectsState on bloc init', () {
    // arrange

    // act

    // assert
    expect(_getFlutterProjectsBloc.initialState,
        const EmptyFlutterProjectsState());
  });

  test('should call GetFlutterProjectsBloc call method', () async {
    // arrange
    _setUpSuccessfulCallToGetFlutterProjectUsecase();

    // act
    _getFlutterProjectsBloc.add(GetFlutterProjectsEvent());
    await untilCalled(() => _mockGetFlutterProjects());

    // assert
    verify(() => _mockGetFlutterProjects());
  });

  test(
      '''should emit [LoadingFlutterProjectsState] and [ErrorFlutterProjectsSkills]
  when getting flutter projects is not successful''', () async {
    // arrange
    when(() => _mockGetFlutterProjects())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // assert later
    expectLater(
        _getFlutterProjectsBloc.stream,
        emitsInOrder(
            [LoadingFlutterProjectsState(), ErrorFlutterProjectsState()]));

    // act
    _getFlutterProjectsBloc.add(GetFlutterProjectsEvent());
    await untilCalled(() => _mockGetFlutterProjects());
  });

  test(
      '''should emit [LoadingFlutterProjectsState] and [LoadedFlutterProjects] with 
      _flutterProjectsList when getting projects is successful''', () async {
    // arrange
    _setUpSuccessfulCallToGetFlutterProjectUsecase();

    // assert later
    expectLater(
      _getFlutterProjectsBloc.stream,
      emitsInOrder(
        [
          LoadingFlutterProjectsState(),
          LoadedFlutterProjectsState(flutterProjects: _flutterProjectsList)
        ],
      ),
    );

    // act
    _getFlutterProjectsBloc.add(GetFlutterProjectsEvent());
    await untilCalled(() => _mockGetFlutterProjects());
  });
}

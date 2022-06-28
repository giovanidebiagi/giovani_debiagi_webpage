import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/repositories/flutter_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/usecases/get_flutter_projects.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterProjectsRepository extends Mock
    implements FlutterProjectsRepository {}

void main() {
  late MockFlutterProjectsRepository _mockFlutterProjectsRepository;
  late GetFlutterProjects _getFlutterProjects;

  setUp(() {
    _mockFlutterProjectsRepository = MockFlutterProjectsRepository();
    _getFlutterProjects = GetFlutterProjects(
        flutterProjectsRepository: _mockFlutterProjectsRepository);
  });

  test(
      'should return Flutter Projects List when getting flutter projects is successful',
      () async {
    // arrange
    final List<String> _flutterProjectImagesPaths = List<String>.generate(
        8, (index) => '/path/to/flutter/project/image/$index');
    final List<FlutterProject> _flutterProjectsList =
        List<FlutterProject>.generate(
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

    when(() => _mockFlutterProjectsRepository.getFlutterProjects())
        .thenAnswer((invocation) async => Right(_flutterProjectsList));

    // act
    final _result = await _getFlutterProjects();

    // assert
    verify(() => _mockFlutterProjectsRepository.getFlutterProjects());
    expect(_result, Right(_flutterProjectsList));
  });

  test(
      'should return [CacheFailure] when getting flutter projects is not successful',
      () async {
    // arrange
    when(() => _mockFlutterProjectsRepository.getFlutterProjects())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // act
    final _result = await _getFlutterProjects();

    // assert

    verify(() => _mockFlutterProjectsRepository.getFlutterProjects());
    expect(_result, Left(CacheFailure()));
  });
}

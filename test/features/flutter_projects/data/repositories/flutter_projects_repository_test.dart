import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/repositories/flutter_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/repositories/i_flutter_projects_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterProjectsDataLocalDatasource extends Mock
    implements IFlutterProjectsDataLocalDatasource {}

void main() {
  late MockFlutterProjectsDataLocalDatasource
      _mockFlutterProjectsDataLocalDatasource;
  late IFlutterProjectsRepository _flutterProjectsRepository;

  setUp(() {
    _mockFlutterProjectsDataLocalDatasource =
        MockFlutterProjectsDataLocalDatasource();
    _flutterProjectsRepository = FlutterProjectsRepository(
        datasource: _mockFlutterProjectsDataLocalDatasource);
  });

  group('get flutter projects', () {
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

    test('should return Flutter Projects list when fetching is successful',
        () async {
      // arrange
      when(() => _mockFlutterProjectsDataLocalDatasource.getFlutterProjects())
          .thenAnswer((invocation) async => _flutterProjectsList);

      // act
      final _result = await _flutterProjectsRepository.getFlutterProjects();

      // assert
      verify(
          () => _mockFlutterProjectsDataLocalDatasource.getFlutterProjects());
      expect(_result, Right(_flutterProjectsList));
    });

    test('should return [CacheFailure] when fetching is not successful',
        () async {
      // arrange
      when(() => _mockFlutterProjectsDataLocalDatasource.getFlutterProjects())
          .thenThrow(CacheException());

      // act
      final _result = await _flutterProjectsRepository.getFlutterProjects();

      // assert
      verify(
          () => _mockFlutterProjectsDataLocalDatasource.getFlutterProjects());
      expect(_result, Left(CacheFailure()));
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/datasources/i_mechatronics_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/repositories/mechatronics_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/i_mechatronics_projects_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockMechatronicsProjectsDataLocalDatasource extends Mock
    implements IMechatronicsProjectsDataLocalDatasource {}

void main() {
  late MockMechatronicsProjectsDataLocalDatasource
      _mockMechatronicsProjectsDataLocalDatasource;
  late IMechatronicsProjectsRepository _mechatronicsProjectsRepository;

  setUp(() {
    _mockMechatronicsProjectsDataLocalDatasource =
        MockMechatronicsProjectsDataLocalDatasource();
    _mechatronicsProjectsRepository = MechatronicsProjectsRepository(
        datasource: _mockMechatronicsProjectsDataLocalDatasource);
  });

  final List<String> _mechatronicsProjectsImagesPaths = List<String>.generate(
      8, (index) => '/path/to/mechatronics/project/image/$index');
  final List<MechatronicsProject> _flutterProjectsList =
      List<MechatronicsProject>.generate(
    8,
    (index) => MechatronicsProject(
      name: 'Mechatronics Project $index',
      description:
          "Quadrotor Control by Teleoperation Using IMU is a project developed during my Mechatronics Engineering undegraduation.\nThe system consists of a Control Glove, a Decision Making Unit (Ubuntu Linux running ROS) and an Unmanned Aerial Vehicle.\nBy using it, the user is able to maneuver a drone vehicle with their hand movements.\n\nSupport: FAPESP (Process: 2016/04117-8)\nLabRom - EESC-USP",
      projectImagesPaths: _mechatronicsProjectsImagesPaths,
    ),
  );

  test('should return Mechatronics Projects list when fetching is successful',
      () async {
    // arrange
    when(() => _mockMechatronicsProjectsDataLocalDatasource
            .getMechatronicsProjects())
        .thenAnswer((invocation) async => _flutterProjectsList);

    // act
    final _result =
        await _mechatronicsProjectsRepository.getMechatronicsProjects();

    // assert
    verify(() =>
        _mockMechatronicsProjectsDataLocalDatasource.getMechatronicsProjects());
    expect(_result, Right(_flutterProjectsList));
  });

  test('should return [CacheFailure] when fetching is not successful',
      () async {
    // arrange
    when(() => _mockMechatronicsProjectsDataLocalDatasource
        .getMechatronicsProjects()).thenThrow(CacheException());

    // act
    final _result =
        await _mechatronicsProjectsRepository.getMechatronicsProjects();

    // assert
    verify(() =>
        _mockMechatronicsProjectsDataLocalDatasource.getMechatronicsProjects());
    expect(_result, Left(CacheFailure()));
  });
}

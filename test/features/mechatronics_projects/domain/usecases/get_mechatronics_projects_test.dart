import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/i_mechatronics_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/usecases/get_mechatronics_projects.dart';
import 'package:mocktail/mocktail.dart';

class MockMechatronicsProjectsRepository extends Mock implements IMechatronicsProjectsRepository {}

void main() {
  late MockMechatronicsProjectsRepository _mockMechatronicsProjectsRepository;
  late GetMechatronicsProjects _getMechatronicsProjects;

  setUp(() {
    _mockMechatronicsProjectsRepository = MockMechatronicsProjectsRepository();
    _getMechatronicsProjects = GetMechatronicsProjects(
        mechatronicsProjectsRepository: _mockMechatronicsProjectsRepository);
  });

  test('should return Mechatronics Projects list when getting mechatronics projects is successful',
      () async {
    // arrange
    final List<String> _mechatronicsProjectImagesPaths =
        List<String>.generate(8, (index) => '/path/to/mechatronics/project/image/$index');
    final List<MechatronicsProject> _mechatronicsProjectsList = List<MechatronicsProject>.generate(
      8,
      (index) => MechatronicsProject(
          name: 'Mechatronics Project $index',
          description:
              "Quadrotor Control by Teleoperation Using IMU is a project developed during my Mechatronics Engineering undegraduation.\nThe system consists of a Control Glove, a Decision Making Unit (Ubuntu Linux running ROS) and an Unmanned Aerial Vehicle.\nBy using it, the user is able to maneuver a drone vehicle with their hand movements.\n\nSupport: FAPESP (Process: 2016/04117-8)\nLabRom - EESC-USP",
          projectImagesPaths: _mechatronicsProjectImagesPaths,
          videosUrl:
              'https://www.youtube.com/watch?v=Fp48DxE-20k&list=PLMFvLxnk4aiLag7BGHFrbJRXZ1Vu9WAT1'),
    );

    when(() => _mockMechatronicsProjectsRepository.getMechatronicsProjects())
        .thenAnswer((invocation) async => Right(_mechatronicsProjectsList));

    // act
    final _result = await _getMechatronicsProjects();

    // assert
    verify(() => _mockMechatronicsProjectsRepository.getMechatronicsProjects());
    expect(_result, Right(_mechatronicsProjectsList));
  });

  test('should return [CacheFailure] when getting mechatronics projects is not successful',
      () async {
    // arrange
    when(() => _mockMechatronicsProjectsRepository.getMechatronicsProjects())
        .thenAnswer((invocation) async => Left(CacheFailure()));

    // act
    final _result = await _getMechatronicsProjects();

    // assert

    verify(() => _mockMechatronicsProjectsRepository.getMechatronicsProjects());
    expect(_result, Left(CacheFailure()));
  });
}

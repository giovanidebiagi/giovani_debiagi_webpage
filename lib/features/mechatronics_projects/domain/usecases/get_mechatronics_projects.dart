import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/i_mechatronics_projects_repository.dart';

class GetMechatronicsProjects {
  final IMechatronicsProjectsRepository mechatronicsProjectsRepository;

  GetMechatronicsProjects({required this.mechatronicsProjectsRepository});

  Future<Either<IFailure, List<MechatronicsProject>>> call() async {
    return await mechatronicsProjectsRepository.getMechatronicsProjects();
  }
}

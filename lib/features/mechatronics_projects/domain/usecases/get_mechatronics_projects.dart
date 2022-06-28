import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/i_failure.dart';
import '../entities/mechatronics_project.dart';
import '../i_mechatronics_projects_repository.dart';

class GetMechatronicsProjects {
  final IMechatronicsProjectsRepository mechatronicsProjectsRepository;

  GetMechatronicsProjects({required this.mechatronicsProjectsRepository});

  Future<Either<IFailure, List<MechatronicsProject>>> call() async {
    return await mechatronicsProjectsRepository.getMechatronicsProjects();
  }
}

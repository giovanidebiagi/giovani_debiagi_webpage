import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';

import 'entities/mechatronics_project.dart';

abstract class IMechatronicsProjectsRepository {
  Future<Either<IFailure, List<MechatronicsProject>>> getMechatronicsProjects();
}

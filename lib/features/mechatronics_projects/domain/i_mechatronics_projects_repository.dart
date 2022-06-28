import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/i_failure.dart';
import 'entities/mechatronics_project.dart';

abstract class IMechatronicsProjectsRepository {
  Future<Either<IFailure, List<MechatronicsProject>>> getMechatronicsProjects();
}

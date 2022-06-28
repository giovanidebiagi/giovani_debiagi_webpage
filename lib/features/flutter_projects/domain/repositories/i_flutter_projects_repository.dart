import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/i_failure.dart';
import '../entities/flutter_project.dart';

abstract class IFlutterProjectsRepository {
  Future<Either<IFailure, List<FlutterProject>>> getFlutterProjects();
}

import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';

abstract class IFlutterProjectsRepository {
  Future<Either<IFailure, List<FlutterProject>>> getFlutterProjects();
}

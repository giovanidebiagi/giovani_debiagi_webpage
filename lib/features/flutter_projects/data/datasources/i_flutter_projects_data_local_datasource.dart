import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/exceptions/i_exception.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';

abstract class IFlutterProjectsDataLocalDatasource {
  Future<List<FlutterProject>> getFlutterProjects();
}

import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/repositories/i_flutter_projects_repository.dart';

class GetFlutterProjects {
  final IFlutterProjectsRepository flutterProjectsRepository;

  GetFlutterProjects({required this.flutterProjectsRepository});

  Future<Either<IFailure, List<FlutterProject>>> call() async {
    return await flutterProjectsRepository.getFlutterProjects();
  }
}

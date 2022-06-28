import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/i_failure.dart';
import '../entities/flutter_project.dart';
import '../repositories/i_flutter_projects_repository.dart';

class GetFlutterProjects {
  final IFlutterProjectsRepository flutterProjectsRepository;

  GetFlutterProjects({required this.flutterProjectsRepository});

  Future<Either<IFailure, List<FlutterProject>>> call() async {
    return await flutterProjectsRepository.getFlutterProjects();
  }
}

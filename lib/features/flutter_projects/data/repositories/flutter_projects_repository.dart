import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../../../core/errors/failures/cache_failure.dart';
import '../datasources/i_flutter_projects_data_local_datasource.dart';
import '../../domain/entities/flutter_project.dart';
import '../../../../core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/i_flutter_projects_repository.dart';

class FlutterProjectsRepository implements IFlutterProjectsRepository {
  final IFlutterProjectsDataLocalDatasource datasource;

  FlutterProjectsRepository({required this.datasource});

  @override
  Future<Either<IFailure, List<FlutterProject>>> getFlutterProjects() async {
    try {
      final _flutterProjects = await datasource.getFlutterProjects();

      return Right(_flutterProjects);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/repositories/i_flutter_projects_repository.dart';

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

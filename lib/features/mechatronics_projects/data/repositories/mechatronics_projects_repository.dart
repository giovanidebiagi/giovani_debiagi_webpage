import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/datasources/i_mechatronics_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/i_mechatronics_projects_repository.dart';

class MechatronicsProjectsRepository
    implements IMechatronicsProjectsRepository {
  final IMechatronicsProjectsDataLocalDatasource datasource;

  MechatronicsProjectsRepository({required this.datasource});

  @override
  Future<Either<IFailure, List<MechatronicsProject>>>
      getMechatronicsProjects() async {
    try {
      final _mechatronicsProjectsList =
          await datasource.getMechatronicsProjects();

      return Right(_mechatronicsProjectsList);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../../../core/errors/failures/cache_failure.dart';
import '../datasources/i_mechatronics_projects_data_local_datasource.dart';
import '../../domain/entities/mechatronics_project.dart';
import '../../../../core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/i_mechatronics_projects_repository.dart';

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

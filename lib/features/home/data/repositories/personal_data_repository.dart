import '../../../../core/errors/exceptions/cache_exception.dart';
import '../../../../core/errors/failures/cache_failure.dart';
import '../datasources/i_personal_data_local_datasource.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/personal_info.dart';
import '../../../../core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/i_personal_data_repository.dart';

class PersonalDataRepository implements IPersonalDataRepository {
  final IPersonalDataLocalDatasource personalDataLocalDatasource;

  PersonalDataRepository({required this.personalDataLocalDatasource});

  @override
  Future<Either<IFailure, PersonalInfo>> getPersonalInfo() async {
    PersonalInfo _personalInfo;

    try {
      _personalInfo = await personalDataLocalDatasource.getPersonalInfo();
    } on CacheException {
      return Left(CacheFailure());
    }

    return Right(_personalInfo);
  }

  @override
  Future<Either<IFailure, List<Skill>>> getSkills() async {
    List<Skill> _skills;

    try {
      _skills = await personalDataLocalDatasource.getSkills();
    } on CacheException {
      return Left(CacheFailure());
    }

    return Right(_skills);
  }
}

import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/cache_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/data/datasources/i_personal_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/repositories/i_personal_data_repository.dart';

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
  Future<Either<IFailure, List<Skill>>> getSkills() {
    // TODO: implement getSkills
    throw UnimplementedError();
  }
}

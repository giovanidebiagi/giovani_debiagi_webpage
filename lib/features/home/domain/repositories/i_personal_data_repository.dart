import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/personal_info.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';

abstract class IPersonalDataRepository {
  Future<Either<IFailure, PersonalInfo>> getPersonalInfo();
  Future<Either<IFailure, List<Skill>>> getSkills();
}

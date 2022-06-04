import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures/i_failure.dart';
import '../entities/personal_info.dart';
import '../entities/skill.dart';

abstract class IPersonalDataRepository {
  Future<Either<IFailure, PersonalInfo>> getPersonalInfo();
  Future<Either<IFailure, List<Skill>>> getSkills();
}

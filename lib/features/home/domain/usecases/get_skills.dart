import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/i_failure.dart';
import '../entities/skill.dart';
import '../repositories/i_personal_data_repository.dart';

class GetSkills {
  final IPersonalDataRepository repository;

  GetSkills({required this.repository});

  Future<Either<IFailure, List<Skill>>> call() async {
    return await repository.getSkills();
  }
}

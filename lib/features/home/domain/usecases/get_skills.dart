import 'package:dartz/dartz.dart';
import 'package:giovani_debiagi_webpage/core/errors/failures/i_failure.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/entities/skill.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/repositories/i_personal_data_repository.dart';

class GetSkills {
  final IPersonalDataRepository repository;

  GetSkills({required this.repository});

  Future<Either<IFailure, List<Skill>>> call() async {
    return await repository.getSkills();
  }
}

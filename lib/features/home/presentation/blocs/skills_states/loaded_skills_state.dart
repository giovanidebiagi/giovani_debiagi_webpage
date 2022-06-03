import 'package:equatable/equatable.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/i_skills_state.dart';

import '../../../domain/entities/skill.dart';

class LoadedSkillsState extends Equatable implements ISkillState {
  final List<Skill> skills;

  const LoadedSkillsState({required this.skills});

  @override
  List<Object?> get props => [];
}

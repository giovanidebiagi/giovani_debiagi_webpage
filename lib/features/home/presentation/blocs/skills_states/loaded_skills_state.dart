import 'package:equatable/equatable.dart';

import '../../../domain/entities/skill.dart';
import 'i_skills_state.dart';

class LoadedSkillsState extends Equatable implements ISkillState {
  final List<Skill> skills;

  const LoadedSkillsState({required this.skills});

  @override
  List<Object?> get props => [];
}

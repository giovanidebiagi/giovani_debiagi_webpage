import 'package:equatable/equatable.dart';
import '../../../domain/entities/mechatronics_project.dart';
import 'i_mechatronics_projects_state.dart';

class LoadedMechatronicsProjectsState extends Equatable
    implements IMechatronicsProjectsState {
  final List<MechatronicsProject> mechatronicsProjects;

  const LoadedMechatronicsProjectsState({required this.mechatronicsProjects});

  @override
  List<Object?> get props => [];
}

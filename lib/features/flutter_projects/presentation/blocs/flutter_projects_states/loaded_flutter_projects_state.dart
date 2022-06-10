import 'package:equatable/equatable.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
import 'i_flutter_projects_state.dart';

class LoadedFlutterProjectsState extends Equatable
    implements IFlutterProjectsState {
  final List<FlutterProject> flutterProjects;

  const LoadedFlutterProjectsState({required this.flutterProjects});

  @override
  List<Object?> get props => [];
}

import 'package:equatable/equatable.dart';
import '../../../domain/entities/flutter_project.dart';
import 'i_flutter_projects_state.dart';

class LoadedFlutterProjectsState extends Equatable
    implements IFlutterProjectsState {
  final List<FlutterProject> flutterProjects;

  const LoadedFlutterProjectsState({required this.flutterProjects});

  @override
  List<Object?> get props => [];
}

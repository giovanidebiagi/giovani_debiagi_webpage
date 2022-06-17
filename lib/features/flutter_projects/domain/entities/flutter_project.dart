import 'package:equatable/equatable.dart';

class FlutterProject extends Equatable {
  final String name;
  final String description;
  final List<String> projectImagesPaths;
  final String gitHubUrl;

  const FlutterProject({
    required this.name,
    required this.description,
    this.projectImagesPaths = const [],
    this.gitHubUrl = '',
  });

  @override
  List<Object?> get props => [name, description, projectImagesPaths, gitHubUrl];
}

import 'dart:convert';

import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';

class FlutterProjectModel extends FlutterProject {
  const FlutterProjectModel(
      {required String name,
      required String description,
      List<String> projectImagesPaths = const []})
      : super(
            name: name,
            description: description,
            projectImagesPaths: projectImagesPaths);

  factory FlutterProjectModel.fromJson(Map<String, dynamic> jsonMap) {
    final List<String> _projectsImagesPaths =
        (jsonDecode(jsonEncode(jsonMap['projectImagesPaths'])) as List<dynamic>)
            .cast<String>();

    return FlutterProjectModel(
      name: jsonMap['name'],
      description: jsonMap['description'],
      projectImagesPaths: _projectsImagesPaths,
    );
  }
}

import 'dart:convert';

import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';

class MechatronicsProjectModel extends MechatronicsProject {
  const MechatronicsProjectModel(
      {required String name,
      required String description,
      required List<String> projectImagesPaths,
      String videosUrl = ''})
      : super(
            name: name,
            description: description,
            projectImagesPaths: projectImagesPaths,
            videosUrl: videosUrl);

  factory MechatronicsProjectModel.fromJson(Map<String, dynamic> jsonMap) {
    final List<String> _projectsImagesPaths =
        (jsonDecode(jsonEncode(jsonMap['projectImagesPaths'])) as List<dynamic>).cast<String>();

    return MechatronicsProjectModel(
      name: jsonMap['name'],
      description: jsonMap['description'],
      projectImagesPaths: _projectsImagesPaths,
      videosUrl: jsonMap['videosUrl'] ?? '',
    );
  }
}

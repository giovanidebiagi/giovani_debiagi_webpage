import 'package:equatable/equatable.dart';

class MechatronicsProject extends Equatable {
  final String name;
  final String description;
  final List<String> projectImagesPaths;
  final String videosUrl;

  const MechatronicsProject(
      {required this.name,
      required this.description,
      required this.projectImagesPaths,
      required this.videosUrl});

  @override
  List<Object?> get props => [name, description, projectImagesPaths, videosUrl];
}

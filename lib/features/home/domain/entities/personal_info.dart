import 'package:equatable/equatable.dart';

class PersonalInfo extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String about;
  final String gitHubUrl;
  final String linkedInUrl;
  final String youTubeUrl;
  final String profilePictureAssetPath;

  const PersonalInfo({
    required this.name,
    required this.lastName,
    required this.email,
    required this.about,
    required this.gitHubUrl,
    required this.linkedInUrl,
    required this.youTubeUrl,
    required this.profilePictureAssetPath,
  });

  @override
  List<Object?> get props => [
        name,
        lastName,
        email,
        about,
        gitHubUrl,
        linkedInUrl,
        youTubeUrl,
        profilePictureAssetPath,
      ];
}

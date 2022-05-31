import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String name;
  final String skillIconAssetPath;

  const Skill({
    required this.name,
    required this.skillIconAssetPath,
  });

  @override
  List<Object?> get props => [name, skillIconAssetPath];
}

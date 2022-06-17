import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/entities/mechatronics_project.dart';

abstract class IMechatronicsProjectsDataLocalDatasource {
  Future<List<MechatronicsProject>> getMechatronicsProjects();
}

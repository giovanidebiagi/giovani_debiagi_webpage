import '../../domain/entities/mechatronics_project.dart';

abstract class IMechatronicsProjectsDataLocalDatasource {
  Future<List<MechatronicsProject>> getMechatronicsProjects();
}

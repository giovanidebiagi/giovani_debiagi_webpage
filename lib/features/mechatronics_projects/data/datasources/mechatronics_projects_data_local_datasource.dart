import 'i_mechatronics_projects_data_local_datasource.dart';
import '../models/mechatronics_project_model.dart';
import '../../domain/entities/mechatronics_project.dart';

import '../../../../core/data/mechatronics_projects_constants.dart';
import '../../../../core/errors/exceptions/cache_exception.dart';

class MechatronicsProjectsDataLocalDatasource
    implements IMechatronicsProjectsDataLocalDatasource {
  @override
  Future<List<MechatronicsProject>> getMechatronicsProjects() async {
    try {
      return MechatronicsProjectsConstants.mechatronicsProjects
          .map((e) => MechatronicsProjectModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

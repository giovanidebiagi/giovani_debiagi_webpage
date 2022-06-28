import '../../../../core/errors/exceptions/cache_exception.dart';
import 'i_flutter_projects_data_local_datasource.dart';
import '../../domain/entities/flutter_project.dart';
import '../../../../core/data/flutter_projects_constants.dart';
import '../models/flutter_project_model.dart';

class FlutterProjectsLocalDatasource
    implements IFlutterProjectsDataLocalDatasource {
  @override
  Future<List<FlutterProject>> getFlutterProjects() async {
    try {
      return FlutterProjectsConstants.flutterProjects
          .map((e) => FlutterProjectModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

import 'package:giovani_debiagi_webpage/core/errors/exceptions/cache_exception.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';
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

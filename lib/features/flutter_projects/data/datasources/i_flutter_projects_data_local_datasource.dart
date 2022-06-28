import '../../domain/entities/flutter_project.dart';

abstract class IFlutterProjectsDataLocalDatasource {
  Future<List<FlutterProject>> getFlutterProjects();
}

import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/data/flutter_projects_constants.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/flutter_projects_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/models/flutter_project_model.dart';

void main() {
  late IFlutterProjectsDataLocalDatasource _flutterProjectsDataLocalDatasource;

  setUp(() {
    _flutterProjectsDataLocalDatasource = FlutterProjectsLocalDatasource();
  });

  test('should get flutter projects when fetching is successful', () async {
    // arrange
    final _flutterProjects = FlutterProjectsConstants.flutterProjects
        .map((e) => FlutterProjectModel.fromJson(e))
        .toList();

    // act
    final _response =
        await _flutterProjectsDataLocalDatasource.getFlutterProjects();

    // assert
    expect(_response, _flutterProjects);
  });
}

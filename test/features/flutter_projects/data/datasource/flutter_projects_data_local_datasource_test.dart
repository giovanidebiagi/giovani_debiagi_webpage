import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/models/flutter_project_model.dart';
import '../../../../fixture_reader.dart';

void main() {
  late IFlutterProjectsDataLocalDatasource _flutterProjectsDataLocalDatasource;
  const String _flutterProjectsJsonFilePath =
      'test/features/flutter_projects/data/fixtures/flutter_projects.json';

  setUp(() {
    _flutterProjectsDataLocalDatasource = FlutterProjectsDataLocalDatasource(
        flutterProjectsJsonFilePath: _flutterProjectsJsonFilePath);
  });

  test('should get flutter projects when fetching is successful', () async {
    // arrange
    final String _flutterProjectsListJsonString =
        readFixture(filePath: _flutterProjectsJsonFilePath);

    final List _flutterProjectsListJson =
        json.decode(_flutterProjectsListJsonString);

    final List<FlutterProjectModel> _flutterProjectsList =
        _flutterProjectsListJson
            .map((data) => FlutterProjectModel.fromJson(data))
            .toList();
    // act
    final _response =
        await _flutterProjectsDataLocalDatasource.getFlutterProjects();

    // assert
    expect(_response, _flutterProjectsList);
  });
}

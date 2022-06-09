import 'dart:convert';
import 'dart:io';

import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/entities/flutter_project.dart';

import '../models/flutter_project_model.dart';

class FlutterProjectsDataLocalDatasource
    implements IFlutterProjectsDataLocalDatasource {
  final String flutterProjectsJsonFilePath;

  FlutterProjectsDataLocalDatasource(
      {required this.flutterProjectsJsonFilePath});

  @override
  Future<List<FlutterProject>> getFlutterProjects() async {
    final String _flutterProjectsListJsonString =
        File(flutterProjectsJsonFilePath).readAsStringSync();

    final List _flutterProjectsListJson =
        json.decode(_flutterProjectsListJsonString) as List;

    final List<FlutterProjectModel> _flutterProjectsList =
        _flutterProjectsListJson
            .map((data) => FlutterProjectModel.fromJson(data))
            .toList();

    return _flutterProjectsList;
  }
}

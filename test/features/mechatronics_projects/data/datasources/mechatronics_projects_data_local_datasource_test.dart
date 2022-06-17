import 'package:flutter_test/flutter_test.dart';
import 'package:giovani_debiagi_webpage/core/data/mechatronics_projects_constants.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/datasources/i_mechatronics_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/datasources/mechatronics_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/models/mechatronics_project_model.dart';

void main() {
  late IMechatronicsProjectsDataLocalDatasource
      _mechatronicsProjectsDataLocalDatasource;

  setUp(() {
    _mechatronicsProjectsDataLocalDatasource =
        MechatronicsProjectsDataLocalDatasource();
  });

  test('should get mechatronics projects when fetching is successful',
      () async {
    // arrange
    final _mechatronicsProjects = MechatronicsProjectsConstants
        .mechatronicsProjects
        .map((e) => MechatronicsProjectModel.fromJson(e))
        .toList();

    // act
    final _response = await _mechatronicsProjectsDataLocalDatasource
        .getMechatronicsProjects();

    // assert
    expect(_response, _mechatronicsProjects);
  });
}

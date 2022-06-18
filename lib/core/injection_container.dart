import 'package:get_it/get_it.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/flutter_projects_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/datasources/i_flutter_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/data/repositories/flutter_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/repositories/i_flutter_projects_repository.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/domain/usecases/get_flutter_projects.dart';
import 'package:giovani_debiagi_webpage/features/flutter_projects/presentation/blocs/get_flutter_projects_bloc.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/data/datasources/i_mechatronics_projects_data_local_datasource.dart';
import 'package:giovani_debiagi_webpage/features/mechatronics_projects/domain/usecases/get_mechatronics_projects.dart';
import '../features/home/data/datasources/i_personal_data_local_datasource.dart';
import '../features/home/data/datasources/personal_data_local_datasource.dart';
import '../features/home/data/repositories/personal_data_repository.dart';
import '../features/home/domain/usecases/get_skills.dart';
import '../features/home/presentation/blocs/get_skills_bloc.dart';

import '../features/home/domain/repositories/i_personal_data_repository.dart';
import '../features/mechatronics_projects/data/datasources/mechatronics_projects_data_local_datasource.dart';
import '../features/mechatronics_projects/data/repositories/mechatronics_projects_repository.dart';
import '../features/mechatronics_projects/domain/i_mechatronics_projects_repository.dart';
import '../features/mechatronics_projects/presentation/blocs/get_mechatronics_projects_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//! Features
// Datasources
  getIt.registerLazySingleton<IPersonalDataLocalDatasource>(() => PersonalDataLocalDatasource());
  getIt.registerLazySingleton<IFlutterProjectsDataLocalDatasource>(
      () => FlutterProjectsLocalDatasource());
  getIt.registerLazySingleton<IMechatronicsProjectsDataLocalDatasource>(
      () => MechatronicsProjectsDataLocalDatasource());

// Repositories
  getIt.registerLazySingleton<IPersonalDataRepository>(
      () => PersonalDataRepository(personalDataLocalDatasource: getIt()));
  getIt.registerLazySingleton<IFlutterProjectsRepository>(
      () => FlutterProjectsRepository(datasource: getIt()));
  getIt.registerLazySingleton<IMechatronicsProjectsRepository>(
      () => MechatronicsProjectsRepository(datasource: getIt()));

// Usecases
  getIt.registerLazySingleton(() => GetSkills(repository: getIt()));
  getIt.registerLazySingleton(() => GetFlutterProjects(flutterProjectsRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetMechatronicsProjects(mechatronicsProjectsRepository: getIt()));

// BLoCs
  getIt.registerFactory(() => GetSkillsBloc(getSkillsUsecase: getIt()));
  getIt.registerFactory(() => GetFlutterProjectsBloc(getFlutterBlocUsecase: getIt()));
  getIt.registerFactory(() => GetMechatronicsProjectsBloc(getMechatronicsBlocUsecase: getIt()));

//! External

//! Core
}

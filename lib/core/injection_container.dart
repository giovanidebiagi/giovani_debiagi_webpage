import 'package:get_it/get_it.dart';
import '../features/home/data/datasources/i_personal_data_local_datasource.dart';
import '../features/home/data/datasources/personal_data_local_datasource.dart';
import '../features/home/data/repositories/personal_data_repository.dart';
import '../features/home/domain/usecases/get_skills.dart';
import '../features/home/presentation/blocs/get_skills_bloc.dart';

import '../features/home/domain/repositories/i_personal_data_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//! Features
// Datasources
  getIt.registerLazySingleton<IPersonalDataLocalDatasource>(
      () => PersonalDataLocalDatasource());

// Repositories
  getIt.registerLazySingleton<IPersonalDataRepository>(
      () => PersonalDataRepository(personalDataLocalDatasource: getIt()));

// Usecases
  getIt.registerLazySingleton(() => GetSkills(repository: getIt()));

// BLoCs
  getIt.registerFactory(() => GetSkillsBloc(getSkillsUsecase: getIt()));

//! External

//! Core
}

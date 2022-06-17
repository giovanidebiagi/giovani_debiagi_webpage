import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_mechatronics_projects.dart';
import 'mechatronics_projects_events/i_get_mechatronics_projects_event.dart';
import 'mechatronics_projects_states/empty_mechatronics_projects_state.dart';
import 'mechatronics_projects_states/error_mechatronics_projects_state.dart';
import 'mechatronics_projects_states/i_mechatronics_projects_state.dart';
import 'mechatronics_projects_states/loaded_mechatronics_projects_state.dart';
import 'mechatronics_projects_states/loading_mechatronics_projects_state.dart';

class GetMechatronicsProjectsBloc
    extends Bloc<IGetMechatronicsProjectsEvent, IMechatronicsProjectsState> {
  final IMechatronicsProjectsState initialState;
  final GetMechatronicsProjects getMechatronicsBlocUsecase;

  GetMechatronicsProjectsBloc({
    required this.getMechatronicsBlocUsecase,
    this.initialState = const EmptyMechatronicsProjectsState(),
  }) : super(initialState) {
    on((event, emit) async {
      emit(LoadingMechatronicsProjectsState());

      final _getMechatronicsProjects = await getMechatronicsBlocUsecase();

      _getMechatronicsProjects.fold(
        (l) {
          emit(ErrorMechatronicsProjectsState());
        },
        (r) => emit(
          LoadedMechatronicsProjectsState(mechatronicsProjects: r),
        ),
      );
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_flutter_projects.dart';
import 'flutter_projects_events/i_get_flutter_projects_event.dart';
import 'flutter_projects_states/empty_flutter_projects_state.dart';
import 'flutter_projects_states/error_flutter_projects_state.dart';
import 'flutter_projects_states/i_flutter_projects_state.dart';
import 'flutter_projects_states/loaded_flutter_projects_state.dart';
import 'flutter_projects_states/loading_flutter_projects_state.dart';

class GetFlutterProjectsBloc
    extends Bloc<IGetFlutterProjectsEvent, IFlutterProjectsState> {
  final IFlutterProjectsState initialState;
  final GetFlutterProjects getFlutterBlocUsecase;

  GetFlutterProjectsBloc({
    required this.getFlutterBlocUsecase,
    this.initialState = const LoadingFlutterProjectsState(),
  }) : super(initialState) {
    on((event, emit) async {
      final _getFlutterProjects = await getFlutterBlocUsecase();

      _getFlutterProjects.fold((l) {
        emit(ErrorFlutterProjectsState());
      }, (r) {
        if (r.isNotEmpty) {
          emit(LoadedFlutterProjectsState(flutterProjects: r));
        } else {
          emit(const EmptyFlutterProjectsState());
        }
      });
    });
  }
}

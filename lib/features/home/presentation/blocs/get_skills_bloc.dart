import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_skills.dart';
import 'skills_events/i_skills_event.dart';
import 'skills_states/empty_skills_state.dart';
import 'skills_states/error_skills_state.dart';
import 'skills_states/i_skills_state.dart';
import 'skills_states/loaded_skills_state.dart';
import 'skills_states/loading_skills_state.dart';

class GetSkillsBloc extends Bloc<ISkillsEvent, ISkillState> {
  final GetSkills getSkillsUsecase;
  final ISkillState initialState;

  GetSkillsBloc(
      {this.initialState = const EmptySkillsState(),
      required this.getSkillsUsecase})
      : super(initialState) {
    on<ISkillsEvent>((event, emit) async {
      emit(LoadingSkillsState());

      final _getSkills = await getSkillsUsecase();

      _getSkills.fold((l) {
        emit(ErrorSkillsState());
      }, (r) {
        emit(LoadedSkillsState(skills: r));
      });
    });
  }
}

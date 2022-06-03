import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giovani_debiagi_webpage/features/home/domain/usecases/get_skills.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_events/i_skills_event.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/empty_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/error_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/i_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/loaded_skills_state.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/blocs/skills_states/loading_skills_state.dart';

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

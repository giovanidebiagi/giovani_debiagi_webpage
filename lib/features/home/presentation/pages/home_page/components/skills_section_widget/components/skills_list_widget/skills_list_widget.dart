import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import '../../../../../../blocs/skills_states/error_skills_state.dart';
import '../../../../../../../../../core/injection_container.dart';
import '../../../../../../blocs/get_skills_bloc.dart';
import '../../../../../../blocs/skills_events/get_skills_event.dart';
import '../../../../../../blocs/skills_states/empty_skills_state.dart';
import '../../../../../../blocs/skills_states/i_skills_state.dart';
import '../../../../../../blocs/skills_states/loaded_skills_state.dart';
import '../../../../../../blocs/skills_states/loading_skills_state.dart';

import 'components/skill_widget.dart';

class SkillsListWidget extends StatefulWidget {
  const SkillsListWidget({Key? key}) : super(key: key);

  @override
  State<SkillsListWidget> createState() => _SkillsListWidgetState();
}

class _SkillsListWidgetState extends State<SkillsListWidget> {
  final _bloc = getIt<GetSkillsBloc>();

  @override
  void initState() {
    _bloc.add(GetSkillsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<GetSkillsBloc, ISkillState>(
        builder: (context, state) {
          if (state is EmptySkillsState) {
            return const Text('No skills registered.');
          } else if (state is ErrorSkillsState) {
            return const Text('There has been an error on getting Skills.');
          } else if (state is LoadingSkillsState) {
            return const CircularProgressIndicator();
          } else if (state is LoadedSkillsState) {
            return SizedBox(
              width: double.infinity,
              child: _screenWidth < SizeConstants.tabletMaxWidth
                  ? Column(children: [
                      Wrap(
                        spacing: 12.0,
                        children: state.skills
                            .map(
                              (skill) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: SkillWidget(
                                  imagePath: skill.skillIconAssetPath,
                                  name: skill.name,
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ])
                  : Wrap(
                      spacing: 12.0,
                      children: state.skills
                          .map(
                            (skill) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: SkillWidget(
                                imagePath: skill.skillIconAssetPath,
                                name: skill.name,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

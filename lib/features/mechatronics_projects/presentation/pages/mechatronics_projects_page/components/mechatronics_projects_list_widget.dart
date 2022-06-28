import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/injection_container.dart';
import '../../../blocs/get_mechatronics_projects_bloc.dart';
import '../../../blocs/mechatronics_projects_events/get_mechatronics_projects_event.dart';
import '../../../blocs/mechatronics_projects_states/empty_mechatronics_projects_state.dart';
import '../../../blocs/mechatronics_projects_states/error_mechatronics_projects_state.dart';
import '../../../blocs/mechatronics_projects_states/i_mechatronics_projects_state.dart';
import '../../../blocs/mechatronics_projects_states/loaded_mechatronics_projects_state.dart';
import '../../../blocs/mechatronics_projects_states/loading_mechatronics_projects_state.dart';
import '../mechatronics_projects_page_widget_templates/mechatronics_projects_page_mechatronics_project_widget.dart';

class MechatronicsProjectsListWidget extends StatefulWidget {
  const MechatronicsProjectsListWidget({Key? key}) : super(key: key);

  @override
  State<MechatronicsProjectsListWidget> createState() =>
      _MechatronicsProjectsListWidgetState();
}

class _MechatronicsProjectsListWidgetState
    extends State<MechatronicsProjectsListWidget> {
  final _bloc = getIt<GetMechatronicsProjectsBloc>();

  @override
  void initState() {
    _bloc.add(GetMechatronicsProjectsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child:
          BlocBuilder<GetMechatronicsProjectsBloc, IMechatronicsProjectsState>(
        builder: (context, state) {
          if (state is EmptyMechatronicsProjectsState) {
            return const Text('No Mechatronics Projects registered.');
          } else if (state is ErrorMechatronicsProjectsState) {
            return const Text(
                'There has been an error on getting Mechatronics Projects.');
          } else if (state is LoadingMechatronicsProjectsState) {
            return const CircularProgressIndicator();
          } else if (state is LoadedMechatronicsProjectsState) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 48.0),
              shrinkWrap: true,
              itemCount: state.mechatronicsProjects.length,
              itemBuilder: (context, index) {
                return MechatronicsProjectsPageMechatronicsProjectWidget(
                  mechatronicsProject: state.mechatronicsProjects[index],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

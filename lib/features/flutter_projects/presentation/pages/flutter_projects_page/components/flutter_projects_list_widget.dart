import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_colors.dart';
import '../../../../../../core/injection_container.dart';
import '../../../blocs/flutter_projects_events/get_flutter_projects_event.dart';
import '../../../blocs/flutter_projects_states/empty_flutter_projects_state.dart';
import '../../../blocs/flutter_projects_states/error_flutter_projects_state.dart';
import '../../../blocs/flutter_projects_states/i_flutter_projects_state.dart';
import '../../../blocs/flutter_projects_states/loaded_flutter_projects_state.dart';
import '../../../blocs/flutter_projects_states/loading_flutter_projects_state.dart';
import '../../../blocs/get_flutter_projects_bloc.dart';
import '../flutter_projects_page_widget_templates/flutter_projects_page_flutter_project_widget.dart';

class FlutterProjectsListWidget extends StatefulWidget {
  const FlutterProjectsListWidget({Key? key}) : super(key: key);

  @override
  State<FlutterProjectsListWidget> createState() =>
      _FlutterProjectsListWidgetState();
}

class _FlutterProjectsListWidgetState extends State<FlutterProjectsListWidget> {
  final _bloc = getIt<GetFlutterProjectsBloc>();

  @override
  void initState() {
    _bloc.add(GetFlutterProjectsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<GetFlutterProjectsBloc, IFlutterProjectsState>(
        builder: (context, state) {
          if (state is EmptyFlutterProjectsState) {
            return const Text('No Flutter Projects registered.');
          } else if (state is ErrorFlutterProjectsState) {
            return const Text(
                'There has been an error on getting Flutter Projects.');
          } else if (state is LoadingFlutterProjectsState) {
            return const CircularProgressIndicator();
          } else if (state is LoadedFlutterProjectsState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.flutterProjects.length,
              itemBuilder: (context, index) {
                return FlutterProjectsPageFlutterProjectWidget(
                  flutterProject: state.flutterProjects[index],
                  color: index % 2 == 0
                      ? AppColors.pagePrimaryBackgroundColor
                      : AppColors.pageSecondaryBackgroundColor,
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

import 'package:flutter/material.dart';
import '../../../../../../../routes/app_routes.dart';
import '../../../../app_navigation_bloc.dart';
import '../../constants/app_navigation_bar_size_constants.dart';
import 'components/app_navigation_bar_navigation_button.dart';

class AppNavigationBarNavigationButtonsWidget extends StatelessWidget {
  const AppNavigationBarNavigationButtonsWidget({required this.appNavigationBloc, Key? key})
      : super(key: key);

  final AppNavigationBloc appNavigationBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppNavigationBarSizeConstants.appNavigationBarButtonsHeight,
      child: StreamBuilder<Object>(
        stream: appNavigationBloc.currentInnerRouteStream,
        builder: (context, snapshot) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppRoutes.appRoutesHashMap.length,
            itemBuilder: (context, index) {
              return AppNavigationBarNavigationButton(
                title: AppRoutes.appRoutesHashMap.keys.elementAt(index),
                navigationBloc: appNavigationBloc,
                isCurrentRoute: snapshot.data == AppRoutes.appRoutesHashMap.values.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}

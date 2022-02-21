import 'package:flutter/material.dart';
import '../../../../constants/app_theme.dart';
import '../../app_navigation_bloc.dart';
import 'components/app_navigation_bar_crypto_quotation_widget/app_navigation_bar_crypto_quotation_widget.dart';
import 'components/app_navigation_bar_navigation_buttons_widget.dart';
import 'constants/app_navigation_bar_size_constants.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({required this.appNavigationBloc, Key? key}) : super(key: key);

  final AppNavigationBloc appNavigationBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppNavigationBarSizeConstants.appNavigationBarButtonsHeight,
      child: Row(
        children: [
          Expanded(
              child: AppNavigationBarNavigationButtonsWidget(appNavigationBloc: appNavigationBloc)),
          const SizedBox(
            height: AppNavigationBarSizeConstants.appNavigationBarButtonsHeight,
            child: AppNavigationBarCryptoQuotationWidget(),
          )
        ],
      ),
    );
  }
}

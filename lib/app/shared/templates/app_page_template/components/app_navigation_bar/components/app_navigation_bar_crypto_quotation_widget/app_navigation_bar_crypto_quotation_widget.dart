import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/shared/constants/app_theme.dart';

import 'components/app_navigation_bar_crypto_asset_quotation_widget.dart';

class AppNavigationBarCryptoQuotationWidget extends StatelessWidget {
  const AppNavigationBarCryptoQuotationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      color: AppTheme.defaultScaffoldBackgroundSecondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppNavigationBarCryptoAssetQuotationWidget(name: 'BTC', price: 100000),
          SizedBox(width: 30),
          AppNavigationBarCryptoAssetQuotationWidget(name: 'ETH', price: 10000),
          SizedBox(width: 30),
          AppNavigationBarCryptoAssetQuotationWidget(name: 'HNT', price: 10000),
        ],
      ),
    );
  }
}

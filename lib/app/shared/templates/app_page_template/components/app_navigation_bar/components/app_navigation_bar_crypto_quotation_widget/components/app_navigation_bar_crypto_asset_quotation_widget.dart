import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/app/shared/constants/app_theme.dart';

class AppNavigationBarCryptoAssetQuotationWidget extends StatelessWidget {
  const AppNavigationBarCryptoAssetQuotationWidget(
      {required this.name, required this.price, Key? key})
      : super(key: key);

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$name:',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 5),
        Text(
          '$price USD',
          style: const TextStyle(color: AppTheme.defaultHighlightBlueColor),
        ),
      ],
    );
  }
}

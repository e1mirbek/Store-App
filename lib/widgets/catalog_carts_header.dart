import 'package:ema_store/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CatalogCartsHeader extends StatelessWidget {
  const CatalogCartsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Корзина", style: AppTextStyles.mainTextStyles),
        Text(
          "Очистить все",
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

import 'package:ema_store/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Католог товаров",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
          ),
        ),
        Text(
          "Выберите лучшее из нашего ассортимента",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.descriptionColor,
          ),
        ),
      ],
    );
  }
}

import 'package:ema_store/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle mainTextStyles = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryTextColor,
  );
  static const TextStyle secondaryTextStyles = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.descriptionColor,
  );
  static const TextStyle categoryTextStyle = TextStyle(
    color: AppColors.mainTextColor,
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryTextColor,
  );
  static const TextStyle ratingTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.descriptionColor,
  );
  static const TextStyle priceTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryTextColor,
  );
}

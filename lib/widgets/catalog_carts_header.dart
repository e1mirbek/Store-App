import 'package:ema_store/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CatalogCartsHeader extends StatelessWidget {
  final String catalogMainText;
  final String clearCartText;
  final void Function()? onTap;
  const CatalogCartsHeader({super.key, this.onTap, required this.catalogMainText, required this.clearCartText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(catalogMainText, style: AppTextStyles.mainTextStyles),
        GestureDetector(
          onTap: onTap,
          child: Text(
            clearCartText,
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:ema_store/providers/cart_provider.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:ema_store/widgets/app_button.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final CartProvider provider;
  const OrderSummary({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.cardBackround,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Итого", style: AppTextStyles.mainTextStyles),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Промежуточный итог",
                style: AppTextStyles.secondaryTextStyles,
              ),
              Text(
                "\$${provider.totalPrice.toStringAsFixed(2)}",
                style: AppTextStyles.secondaryTextStyles,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Доставка", style: AppTextStyles.secondaryTextStyles),
              Text(
                "Бесплатно",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Всего", style: AppTextStyles.mainTextStyles),
              Text(
                "\$${provider.totalPrice.toStringAsFixed(2)}",
                style: AppTextStyles.mainTextStyles,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          AppButton(title: "Оформить заказ", onPressed: () {}),
          const SizedBox(height: 15.0),
          Center(
            child: Text(
              "Гарантия безопосной оплаты",
              style: AppTextStyles.secondaryTextStyles,
            ),
          ),
        ],
      ),
    );
  }
}

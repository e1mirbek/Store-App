import 'package:ema_store/models/product.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:ema_store/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.cardBackround,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Center(child: Image.network(product.image)),
            ),
            const SizedBox(height: 20.0),
            Text(
              product.category.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.categoryTextStyle,
            ),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.descriptionTextStyle,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "🌟${product.rating.rate}",
                  style: AppTextStyles.ratingTextStyle,
                ),
                const SizedBox(width: 5.0),
                Text(
                  "(${product.rating.count})",
                  style: AppTextStyles.ratingTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text("\$${product.price}", style: AppTextStyles.priceTextStyle),
            const SizedBox(height: 10.0),
            AppButton(
              title: "В корзину",
              // добавление товара в корзину
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

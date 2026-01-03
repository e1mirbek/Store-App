import 'package:ema_store/models/cart_item.dart';
import 'package:ema_store/providers/cart_provider.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final VoidCallback onDelete;
  const CartProductCard({
    super.key,
    required this.cartItem,
    required this.onPlus,
    required this.onMinus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final product = cartItem.products;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.cardBackround),
      child: Row(
        children: [
          Image.network(product.image, height: 80, width: 80),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    product.title,
                    style: AppTextStyles.descriptionTextStyle,
                  ),
                  Text(
                    product.category.toUpperCase(),
                    style: AppTextStyles.cartCategoryTextStyles,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      _buildQtyButton("-", onMinus),
                      const SizedBox(width: 20.0),
                      Text(
                        "${cartItem.quantity}",
                        style: AppTextStyles.descriptionTextStyle,
                      ),
                      const SizedBox(width: 20.0),
                      _buildQtyButton("+", onPlus),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Text("\$${cartItem.total}", style: AppTextStyles.priceTextStyle),
              const SizedBox(height: 10),
              // Иконка мусорки
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.grey),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

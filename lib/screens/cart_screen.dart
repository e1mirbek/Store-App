import 'package:ema_store/models/cart_item.dart';
import 'package:ema_store/providers/cart_provider.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:ema_store/widgets/app_button.dart';
import 'package:ema_store/widgets/cart_product_card.dart';
import 'package:ema_store/widgets/catalog_carts_header.dart';
import 'package:ema_store/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    final cartItems = cartProvider.items;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackround,
      appBar: _appBar(context),

      // проверка пуста ли корзина
      body: cartItems.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _emptyStateWidget(context),
              ),
            )
          : _buildBody(cartItems, cartProvider),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBarBackround,
      title: Text(
        "EMA-STORE",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
            icon: Icon(Icons.shopping_cart_outlined, size: 30.0),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(List<CartItem> items, CartProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CatalogCartsHeader(),
            _buildCartProductListView(items, provider),
            OrderSummary(provider: provider),
          ],
        ),
      ),
    );
  }

  Widget _emptyStateWidget(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.cardBackround,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 70,
                color: AppColors.iconColor,
              ),
              const SizedBox(height: 20.0),
              Text("Ваша корзина пуста", style: AppTextStyles.mainTextStyles),
              const SizedBox(height: 10.0),
              Text(
                textAlign: TextAlign.center,
                "Кажется, вы еще не добавили\n ни одного товара",
                style: AppTextStyles.secondaryTextStyles,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Spacer(),
                  AppButton(
                    title: "Перейти к покупкам",
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartProductListView(
    List<CartItem> items,
    CartProvider cartProvider,
  ) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];
        return CartProductCard(
          cartItem: item, // передача весь обьект с корзином
          onPlus: () => cartProvider.addToCart(item.products),
          onMinus: () => cartProvider.decreaseQuantity(item),
          onDelete: () {},
        );
      },
    );
  }
}

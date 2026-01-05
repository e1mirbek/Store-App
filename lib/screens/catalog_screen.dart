import 'package:ema_store/models/product.dart';
import 'package:ema_store/providers/product_provider.dart';
import 'package:ema_store/screens/cart_screen.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/widgets/catalog_header.dart';
import 'package:ema_store/widgets/app_button.dart';
import 'package:ema_store/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerProvider = context.watch<ProductProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackround,
      appBar: _appBar(context),
      body: SafeArea(child: _buildBody(providerProvider)),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
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

  Widget _buildBody(ProductProvider provider) {
    // loading process
    if (provider.isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_outlined,
                color: AppColors.descriptionColor,
                size: 60,
              ),
              const SizedBox(height: 30.0),
              Text(
                "${provider.errorMessage!}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 30.0),
              AppButton(
                title: "Повторить попытку",
                onPressed: () => provider.loadProducts(),
                backgroundColor: AppColors.buttonBackround,
                foregroundColor: AppColors.buttonTextColor,
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Catalogheader(),
            const SizedBox(height: 20.0),
            _buildProductGrid(provider.products),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<ProductModel> products) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0, // horizontal
        crossAxisSpacing: 10.0, // vertical
        childAspectRatio: 0.4,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

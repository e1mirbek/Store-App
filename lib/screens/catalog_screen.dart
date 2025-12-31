import 'package:ema_store/providers/product_provider.dart';
import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerProvider = context
        .watch<ProductProvider>(); // Следим за изменениями

    final products = providerProvider.products; // список товаров из API

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackround,
      appBar: AppBar(
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
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined, size: 30.0),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: providerProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 30.0,
                  ),
                  child: Column(
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
                      const SizedBox(height: 20.0),
                      GridView.builder(
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
                          final product = products[index];
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.cardBackround,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Image.network(product.image),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    product.category,
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
                                  Text(
                                    "\$${product.price}",
                                    style: AppTextStyles.priceTextStyle,
                                  ),
                                  const SizedBox(height: 10.0),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      backgroundColor:
                                          AppColors.buttonBackround,
                                      foregroundColor:
                                          AppColors.buttonTextColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "В корзину",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

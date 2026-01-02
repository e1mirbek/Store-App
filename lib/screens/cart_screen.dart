import 'package:ema_store/theme/app_colors.dart';
import 'package:ema_store/theme/app_text_styles.dart';
import 'package:ema_store/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackround,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              ),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.red),
                    child: Row(
                      children: [
                        Image.network(
                          "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: _emptyStateWidget(context),
      //   ),
      // ),
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
}

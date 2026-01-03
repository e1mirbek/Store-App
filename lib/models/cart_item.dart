import 'package:ema_store/models/product.dart';

class CartItem {
  final ProductModel products;
  int quantity; // количество

  CartItem({required this.products, this.quantity = 1});

  double get total => quantity * products.price;
}

import 'package:ema_store/models/product.dart';

class CartItem {
  final ProductModel product;
  int quantity; // количество

  CartItem({required this.product, required this.quantity});

  // цена - кол-во
  // total - общий

  // Getter - для подсчета

  double get total => quantity * product.price;
}

import 'package:ema_store/models/product.dart';

class CartItem {
  final ProductModel product;
  int quantity; // количество

  CartItem({required this.product, this.quantity = 1});

  // цена - кол-во
  // total - общий

  // Getter - для подсчета

  double get total => quantity * product.price;
}

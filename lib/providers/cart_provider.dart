import 'package:ema_store/models/cart_item.dart';
import 'package:ema_store/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // add to cart

  void addToCart(ProductModel newProduct) {
    int index = _items.indexWhere((item) => item.products.id == newProduct.id);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(products: newProduct));
    }
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      return;
    }
    notifyListeners();
  }

  // delete product

  void deleteFromCarts(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // clear all cards products

  void cartsClear() {
    _items.clear();
    notifyListeners();
  }

  // Общая стоимость всей корзины

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.total);
  }
}

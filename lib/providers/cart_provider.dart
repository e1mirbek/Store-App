import 'package:ema_store/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> _cartItems = [];

  // getter

  List<ProductModel> get cartItems => _cartItems;

  // метод добавление товара в корзину

  void addProductItem(ProductModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  // метод удаление товара из корзины

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}

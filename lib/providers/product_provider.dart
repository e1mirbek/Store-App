import 'dart:developer' as developer;

import 'package:ema_store/models/product.dart';
import 'package:ema_store/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  // метод для загрузки данных

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners(); // начало загрузки

    try {
      _products = await ApiService.getProducts();
    } catch (e) {
      developer.log("Ошибка >>> $e");
    } finally {
      _isLoading = false;
      notifyListeners(); // конец загрузки, отображаем данные
    }
  }
}

import 'dart:developer' as developer;
import 'dart:io';

import 'package:ema_store/models/product.dart';
import 'package:ema_store/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  bool _isLoading = false;
  String? _errorMessage;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // метод для загрузки данных

  Future<void> loadProducts() async {
    _errorMessage = null;
    _isLoading = true;
    notifyListeners(); // начало загрузки

    try {
      _products = await ApiService.getProducts();
    } catch (e) {
      String errorText = e.toString();
      if (errorText.contains('SocketException') ||
          errorText.contains("ClientException")) {
        _errorMessage =
            "Похоже, пропал интернет. Проверьте соединение и попробуйте снова.";
      } else if (errorText.contains('404')) {
        _errorMessage = "Товары не найдены (ошибка 404)";
      } else {
        _errorMessage = "Произошла непредвиденная ошибка. Мы уже чиним!";
      }
    } finally {
      _isLoading = false;
      notifyListeners(); // конец загрузки, отображаем данные
    }
  }
}

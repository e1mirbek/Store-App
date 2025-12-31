// 1. класс для работы с API - стучится в интернет

import 'dart:convert'; // для декодировки (расшрифрока Json  в List )

import 'package:ema_store/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // 2. получаем URL
  static const String _baseUrl = "https://fakestoreapi.com/products";

  // 3. метод для получения продуктов из интернета
  static Future<List<ProductModel>> getProducts() async {
    try {
      // 4. делаем запрос в интернет
      final responce = await http.get(Uri.parse(_baseUrl));

      // 200 → «Вот, держи, всё нормально» ✅

      // 404 → «Такой страницы нет» ❌

      // 500 → «У меня ошибка на сервере» ⚠️

      // 5. если ответ успешный - парсим данные

      if (responce.statusCode == 200) {
        // декодировка строка json в - List

        List<dynamic> body = json.decode(responce.body);

        // превращаем каждый список элемента в обьект ProductModel

        List<ProductModel> products = body
            .map((dynamic item) => ProductModel.fromJson(item))
            .toList();

        return products;
        //
      } else {
        throw "не удалось загрузить товары Статус : ${responce.statusCode}";
      }
    } catch (e) {
      throw "Ошибка сети $e";
    }
  }
}

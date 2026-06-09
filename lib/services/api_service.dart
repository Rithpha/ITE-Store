import 'dart:convert';

import 'package:flutter_application_api/app/config.dart';
import 'package:flutter_application_api/models/product.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final url = '${Config().apiBaseUrl}products.json';
    final response = await get(Uri.parse(url));

    if (response.statusCode != 200) return [];

    final jsonMap = jsonDecode(response.body);
    return (jsonMap as List).map((json) => Product.fromJson(json)).toList();
  }
}

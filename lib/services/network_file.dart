import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:zupay_task/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  Response response;
  var dio = Dio();
  response = await dio.get('https://fakestoreapi.com/products');
  List<Product> products = [];
  response.data.forEach((val) => products.add(Product.fromMap(val)));
  print(products.toString());
 // print(products[1].itemTitle);
  return products;
}

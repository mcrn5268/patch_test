import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<String> _categories = [];

  List<Product> get products => _products;
  List<String> get categories => _categories;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products?limit=50'));
    final extractedData = json.decode(response.body) as List<dynamic>;
    _products = extractedData.map((productData) => Product.fromJson(productData)).toList();
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    _categories = (json.decode(response.body) as List<dynamic>).cast<String>();
    notifyListeners();
  }
}

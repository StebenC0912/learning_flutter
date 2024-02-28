import "package:flutter/material.dart";
import "package:learning_flutter/utils/product_item.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class Product {
  final int id;
  final String thumbnail;
  final String name;
  final String category;
  final int unitPrice;

  Product({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.category,
    required this.unitPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      thumbnail: json['thumbnail'],
      name: json['name'],
      category: json['category'],
      unitPrice: json['unitPrice'],
    );
  }
}

class _MainPageState extends State<MainPage> {
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome 2 pages'),
          backgroundColor: Colors.green,
          // disable the back button
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(
              productName: products[index].name,
              price: products[index].unitPrice.toString(),
              imageURL: products[index].thumbnail,
            );
          },
        ));
  }

  Future fetchProducts() async {
    final response = await http.get(
        Uri.parse('https://hanu-congnv.github.io/mpr-cart-api/products.json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        products = jsonList.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }
}

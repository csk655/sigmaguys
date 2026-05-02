/*
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final double price;
  final double oldPrice;
  final String image;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price']).toDouble(),
      oldPrice: (json['oldPrice']).toDouble(),
      image: json['image'],
      rating: (json['rating']).toDouble(),
    );
  }

  static List<Product> fromJsonList(String jsonString) {
    final data = json.decode(jsonString);
    return List<Product>.from(data.map((e) => Product.fromJson(e)));
  }
}*/
import 'dart:convert';

import 'dart:convert';

class Product {
  final int id;
  final String brand;
  final String title;
  final String description;
  final int price;
  final int mrp;
  final int discount;
  final int wowPrice;
  final String image;
  final double rating;
  final String reviews;
  final String tag;
  final String delivery;
  final bool isExpress;

  Product({
    required this.id,
    required this.brand,
    required this.title,
    required this.description,
    required this.price,
    required this.mrp,
    required this.discount,
    required this.wowPrice,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.tag,
    required this.delivery,
    required this.isExpress,
  });

  factory Product.fromMap(Map<String, dynamic> m) => Product(
    id: m['id'],
    brand: m['brand'],
    description: m['description'],
    title: m['title'],
    price: m['price'],
    mrp: m['mrp'],
    discount: m['discount'],
    wowPrice: m['wowPrice'],
    image: m['image'],
    rating: (m['rating'] as num).toDouble(),
    reviews: m['reviews'],
    tag: m['tag'],
    delivery: m['delivery'],
    isExpress: m['isExpress'],
  );

  static List<Product> fromJsonList(String str) {
    final data = json.decode(str);
    return List<Product>.from(data.map((x) => Product.fromMap(x)));
  }
}
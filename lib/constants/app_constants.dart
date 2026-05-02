import 'package:flutter/material.dart';

class AppConstants {
  static const String productsJson = '''
  [
  {
    "id": 1,
    "brand": "Sigma Guys",
    "title": "Marathon X Melts - Instant Performance Boost (10 Melts)",
    "description": "Experience powerful performance boost with Marathon X Melts.Designed for instant action and long-lasting effect.",
    "image": "assets/images/products/marathon x_melts.webp",
    "price": 449,
    "mrp": 699,
    "discount": 36,
    "wowPrice": 399,
    "rating": 4.8,
    "reviews": "3.5k",
    "tag": "AD",
    "delivery": "Delivery tomorrow",
    "isExpress": true
  },
  {
    "id": 2,
    "brand": "Sigma Guys",
    "title": "Activate Roller",
    "description": "Activate Roller by Sigma Guys helps awaken the scalp and support hair strength at the roots. Its targeted rolling action promotes scalp stimulation and improved absorption, supporting thicker-looking, healthier hair over time. Built for men who value effective, no-fuss hair care",
    "image": "assets/images/products/active_roller.webp",
    "price": 499,
    "mrp": 849,
    "discount": 41,
    "wowPrice": 449,
    "rating": 4.8,
    "reviews": "3.5k",
    "tag": "BESTSELLER",
    "delivery": "Delivery today",
    "isExpress": true
  },
  {
    "id": 3,
    "brand": "Sigma Guys",
    "title": "TestoBoost Capsules",
    "description": "Helps support consistent energy levels and endurance throughout the day, not just during workouts.",
    "image": "assets/images/products/testto.webp",
    "price": 599,
    "mrp": 1099,
    "discount": 45,
    "wowPrice": 549,
    "rating": 4.7,
    "reviews": "3.3k",
    "tag": "POPULAR",
    "delivery": "Delivery today",
    "isExpress": true
  },
  {
    "id": 4,
    "brand": "Sigma Guys",
    "title": "Delay Spray",
    "description": "Experience prolonged pleasure and enhanced confidence with our scientifically formulated Delay Spray. Featuring a 10% Lidocaine formula, this spray helps extend climaxes and allows you to last longer in the bedroom. See noticeable results in just 15-30 minutes!",
    "image": "assets/images/products/p1.webp",
    "price": 699,
    "mrp": 2249,
    "discount": 69,
    "wowPrice": 649,
    "rating": 4.8,
    "reviews": "3.6k",
    "tag": "BEST VALUE",
    "delivery": "Delivery tomorrow",
    "isExpress": true
  },
  {
    "id": 5,
    "brand": "Sigma Guys",
    "title": "Regrow 10% – Advanced Hair Regrowth Spray for Thinning Hair",
    "description": "Less hair fall in 2–4 weeks,Visible regrowth in 8–12 weeks",
    "image": "assets/images/products/spray_hair_growth.webp",
    "price": 899,
    "mrp": 1549,
    "discount": 42,
    "wowPrice": 829,
    "rating": 4.7,
    "reviews": "2.9k",
    "tag": "COMBO",
    "delivery": "Delivery tomorrow",
    "isExpress": true
  },
  {
    "id": 6,
    "brand": "Sigma Guys",
    "title": "Shilajit Gummies",
    "description": "Strength Meets Flavour—Daily Power in Every Bite.",
    "image": "assets/images/products/shila.webp",
    "price": 699,
    "mrp": 2249,
    "discount": 69,
    "wowPrice": 629,
    "rating": 4.8,
    "reviews": "3.7k",
    "tag": "TRENDING",
    "delivery": "Delivery today",
    "isExpress": true
  }
]
  ''';

  static const banners = [
    "assets/images/banners/banner1.webp",
    "assets/images/banners/banner2.webp",
    "assets/images/banners/banner3.webp"
  ];
  static const filterItems = [
    {"icon": Icons.sort, "text": "Sort"},
    {"icon": Icons.tune, "text": "Filter"},
    {"icon": Icons.local_fire_department, "text": "Latest Trends", "highlight": true},
    {"icon": Icons.star_border, "text": "Top Rated"},
  ];

  static const List<Map<String, String>> categories = [
    {"title": "Best Sellers", "image": "assets/images/categories/c1.webp"},
    {"title": "Performance", "image": "assets/images/categories/c2.webp"},
    {"title": "Hair", "image": "assets/images/categories/c3.webp"},
    {"title": "Bundles", "image": "assets/images/categories/c4.webp"},
    {"title": "Build Your Own Bundle", "image": "assets/images/categories/c5.webp"},
    {"title": "All", "image": "assets/images/categories/c6.webp"},
  ];
}

/*
class AppConstants {
  static const String productsJson = '''
  [
    {"id":1,"title":"iPhone 15 Pro","price":129999,"image":"assets/images/products/p1.webp","rating":4.8},
    {"id":2,"title":"Sony Headphones","price":19999,"image":"assets/images/products/p2.webp","rating":4.5},
    {"id":3,"title":"Smart Watch","price":9999,"image":"assets/images/products/p3.webp","rating":4.2},
    {"id":4,"title":"Gaming Mouse","price":2499,"image":"assets/images/products/p1.webp","rating":4.6}
  ]
  ''';

  static const banners = [
    "assets/images/banners/banner1.webp",
    "assets/images/banners/banner2.webp",
    "assets/images/banners/banner3.webp"
  ];

  static const categories = [
    {"name": "Electronics", "icon": "assets/images/categories/cat1.webp"},
    {"name": "Fashion", "icon": "assets/images/categories/cat2.webp"},
    {"name": "Home", "icon": "assets/images/categories/cat3.webp"},
  ];

  static const productsImages = [
    "assets/images/products/p1.webp",
    "assets/images/products/p2.webp",
    "assets/images/products/p3.webp",
  ];
}*/

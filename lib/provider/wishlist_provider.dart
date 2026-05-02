import 'package:flutter/material.dart';

import '../models/product.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  bool isInWishlist(Product product) {
    return _items.any((p) => p.id == product.id);
  }

  void toggleWishlist(Product product) {
    if (isInWishlist(product)) {
      _items.removeWhere((p) => p.id == product.id);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }
}
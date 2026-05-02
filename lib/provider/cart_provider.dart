import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((e) => e.product.id == product.id);
    notifyListeners();
  }

  void increaseQty(Product product) {
    final item = _items.firstWhere((e) => e.product.id == product.id);
    item.quantity++;
    notifyListeners();
  }

  void decreaseQty(Product product) {
    final item = _items.firstWhere((e) => e.product.id == product.id);

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      removeFromCart(product);
    }
    notifyListeners();
  }

  int get totalPrice {
    return _items.fold(
      0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  bool isInCart(Product product) {
    return _items.any((e) => e.product.id == product.id);
  }
}
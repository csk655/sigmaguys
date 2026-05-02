import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/wishlist_provider.dart';
import '../widgets/product_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
      ),
      body: Consumer<WishlistProvider>(
        builder: (context, wishlist, _) {
          if (wishlist.items.isEmpty) {
            return const Center(
              child: Text("Your wishlist is empty ❤️"),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: wishlist.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: wishlist.items[index]);
            },
          );
        },
      ),
    );
  }
}
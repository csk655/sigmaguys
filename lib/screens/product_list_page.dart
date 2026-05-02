import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/constants/app_constants.dart';
import 'package:sigma_store/screens/product_detail_page.dart';

import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../widgets/product_card.dart';
import 'cart_page.dart';

class ProductListPage extends StatelessWidget {
  //final List<Product> products;

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products = Product.fromJsonList(AppConstants.productsJson);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFEAF1FB),
            elevation: 0,
            titleSpacing: 0,
            title: Row(
              children: [

                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search products",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Consumer<CartProvider>(
                  builder: (context, cart, _) {
                    return Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CartPage()),
                            );
                          },
                        ),
                        if (cart.items.isNotEmpty)
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "${cart.items.length}",
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),


          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {


                  final item = AppConstants.filterItems[index];

                  return _chip(
                    item["icon"] as IconData,
                    item["text"] as String,
                    isHighlight: item["highlight"] == true,
                  );
                },
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all( 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return InkWell(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(product: products[index]),
                        ),
                      );
                    },
                      child: ProductCard(product: products[index]));
                },
                childCount: products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 12,
                childAspectRatio: 0.60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String text, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlight ? Colors.purple.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: isHighlight ? Colors.purple : Colors.black54),
          const SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }
}
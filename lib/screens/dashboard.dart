import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_store/screens/cart_page.dart';
import 'package:sigma_store/screens/wish_list_page.dart';
import 'package:sigma_store/widgets/home_screen.dart';

import '../provider/cart_provider.dart';
import '../provider/wishlist_provider.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    WishlistPage(),
    //Center(child: Text("Cart")),
    CartPage(),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          // selectedItemColor: Color(0xffE1EBC9),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              label: "Wishlist",
              icon: Consumer<WishlistProvider>(
                builder: (context, wishlist, _) {
                  final count = wishlist.items.length;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [

                      const Icon(Icons.favorite),
                      if (count > 0)
                        Positioned(
                          right: -6,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              count > 9 ? '9+' : '$count',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Consumer<CartProvider>(
                builder: (context, cart, _) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [

                      const Icon(Icons.shopping_cart),

                      if (cart.items.isNotEmpty)
                         Positioned(
                          right: -6,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${cart.items.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
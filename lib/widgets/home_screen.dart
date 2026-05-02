import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/product.dart';
import '../screens/product_detail_page.dart';
import '../screens/product_list_page.dart';
import 'product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Product.fromJsonList(AppConstants.productsJson);

    return SafeArea(
      child: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(child: _appBar()),
          SliverToBoxAdapter(child: BannerSlider()),
          SliverToBoxAdapter(child: _sectionTitle("Shop By Category","")),
         SliverToBoxAdapter(child: CategoryGrid()),
          SliverToBoxAdapter(child:
          _sectionTitle("Today's Deals","View All")),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length > 4 ? 4 : products.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12), // tighter spacing
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 170,
                    child:
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: products[index]),
                          ),
                        );
                      },
                        child: ProductCard(product: products[index])),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on, size: 16, color: Colors.black87),
              ),
              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Deliver to",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Mumbai 400042",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [

                const SizedBox(width: 12),

                const Icon(Icons.search, color: Colors.black54),

                const SizedBox(width: 8),

                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search products, brands...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),

                Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey.shade300,
                ),

                const SizedBox(width: 10),

                const Icon(Icons.qr_code_scanner, color: Colors.black54),

                const SizedBox(width: 12),

                const Icon(Icons.mic, color: Colors.black54),

                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

}



// ---------------- BANNER ----------------
class BannerSlider extends StatefulWidget {
  @override
  State<BannerSlider> createState() => _BannerSliderState();
}



class _BannerSliderState extends State<BannerSlider> {
  final controller = PageController(viewportFraction: 0.9);
  int index = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (t) {
      if (!controller.hasClients) return;
      index = (index + 1) % AppConstants.banners.length;
      controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: controller,
        itemCount: AppConstants.banners.length,
        itemBuilder: (_, i) {
          return AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: i == index ? 1 : 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(AppConstants.banners[i], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CategoryGrid extends StatefulWidget {
  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppConstants.categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 0,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final item = AppConstants.categories[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            //setState(() => selectedIndex = index);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductListPage(),
              ),
            );
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: isSelected ? 0.95 : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: isSelected
                          ? [Colors.black87, Colors.black54]
                          : [Colors.white, Color(0xFFF1F1F1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isSelected ? 0.15 : 0.06),
                        blurRadius: isSelected ? 12 : 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ClipOval(
                      child: ColorFiltered(
                        colorFilter: isSelected
                            ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                            : const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
                        child: Image.asset(
                          item["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// 📝 Text
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.black87,
                  ),
                  child: Text(
                    item["title"]!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _sectionTitle(String title,String subText) {
  return Padding(
    padding: const EdgeInsets.only(left: 12,top: 12,right: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(subText),
      ],
    ),
  );
}

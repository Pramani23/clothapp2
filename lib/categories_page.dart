import 'package:flutter/material.dart';
import 'home_page_1.dart';
import 'cart_page.dart';
import 'settings_page.dart';
import 'wishlist_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'LUXE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'X',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---------------- TITLE ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 27),
                  ),

                  const SizedBox(width: 43),

                  const Text('Categories', style: TextStyle(fontSize: 25)),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ---------------- CATEGORY GRID ----------------
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const padding = 16.0;
                  const spacing = 14.0;
                  final cellWidth =
                      (constraints.maxWidth - padding * 2 - spacing) / 2;
                  final cellHeight =
                      (constraints.maxHeight - padding * 2 - spacing) / 2;

                  return GridView.count(
                    padding: const EdgeInsets.all(padding),
                    crossAxisCount: 2,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: cellWidth / cellHeight,
                    children: [
                      categoryItem('assets/category_dress.png', 'Dresses'),
                      categoryItem('assets/category_top.png', 'Tops'),
                      categoryItem('assets/category_western.png', 'Western'),
                      categoryItem('assets/category_saree.png', 'Saree'),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION ----------------
      bottomNavigationBar: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePageOne()),
                );
              },
              icon: const Icon(Icons.home_outlined, size: 25),
            ),
            IconButton(
              tooltip: 'Wishlist',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WishlistPage()),
                );
              },
              icon: const Icon(Icons.favorite_border, size: 25),
            ),
            IconButton(
              tooltip: 'Categories',
              onPressed: () {},
              icon: const Icon(Icons.list, size: 27),
            ),
            IconButton(
              tooltip: 'Cart',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined, size: 25),
            ),
            IconButton(
              tooltip: 'Account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
              icon: const Icon(Icons.person_outline, size: 27),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- CATEGORY ITEM ----------------
  Widget categoryItem(String imagePath, String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFFE8E8E8),
                alignment: Alignment.center,
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              );
            },
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0x99000000)],
                stops: [0.45, 1],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

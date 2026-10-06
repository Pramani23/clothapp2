import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'address_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30),

              // ---------------- TITLE ----------------
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 25),

              // ---------------- MENU ITEMS ----------------
              menuItem('⚙️', 'Settings'),
              menuItem('🏷️', 'Deals'),
              menuItem('📍', 'My Addresses', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressPage()));
              }),
              menuItem('👤', 'Profile'),
              menuItem('💳', 'Payment methods'),
              menuItem('❤️', 'Favorites'),
            ],
          ),
        ),
      ),

      // ---------------- BOTTOM NAVIGATION ----------------
      bottomNavigationBar: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('🏠', style: TextStyle(fontSize: 21)),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WishlistPage()));
              },
              child: const Icon(Icons.favorite_border, size: 25),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesPage()));
              },
              child: const Icon(Icons.list, size: 27),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: const Text('🛍️', style: TextStyle(fontSize: 21)),
            ),

            const Icon(Icons.person, size: 27, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  // ---------------- MENU ITEM ----------------
  Widget menuItem(String emoji, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(width: 18),

            Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

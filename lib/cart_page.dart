import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'settings_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Cart items
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/wishlist3.png',
      'name': 'Western Top',
      'detail': 'Pink -M',
      'price': 450,
      'qty': 2,
    },
    {
      'image': 'assets/wishlist4.png',
      'name': 'Western Pink Gown',
      'detail': 'Light Pink -XL',
      'price': 400,
      'qty': 3,
    },
    {
      'image': 'assets/wishlist2.png',
      'name': 'Saree',
      'detail': 'free Size',
      'price': 900,
      'qty': 1,
    },
  ];

  int get totalPrice {
    int total = 0;
    for (var item in cartItems) {
      total += (item['price'] as int) * (item['qty'] as int);
    }
    return total;
  }

  void increaseQty(int index) {
    setState(() {
      cartItems[index]['qty']++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]['qty'] > 1) {
        cartItems[index]['qty']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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

            const SizedBox(height: 30),

            // ---------------- TITLE ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 28),
                  ),
                  const SizedBox(width: 30),
                  const Text('My Cart', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------------- CART ITEMS ----------------
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return cartItem(item, index);
                },
              ),
            ),

            // ---------------- TOTAL ----------------
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                color: const Color(0xFFC8B1C8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION ----------------
      bottomNavigationBar: bottomNav(context),
    );
  }

  // ---------------- CART ITEM ----------------
  Widget cartItem(Map<String, dynamic> item, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          SizedBox(
            width: 100,
            height: 115,
            child: Image.asset(
              item['image'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFE8E8E8),
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),

          const SizedBox(width: 15),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'], style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 3),
                Text(item['detail'], style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 3),
                Text(
                  '\$${item['price']}',
                  style: const TextStyle(fontSize: 14),
                ),

                const SizedBox(height: 25),

                // Quantity +/-
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => decreaseQty(index),
                      child: const Text('-', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      color: const Color(0xFFE0E0E0),
                      child: Text('${item['qty']}'),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => increaseQty(index),
                      child: const Text('+', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV (shared style) ----------------
  static Widget bottomNav(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.shopping_bag, size: 25, color: Colors.blueGrey),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
            child: const Icon(Icons.person, size: 27, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

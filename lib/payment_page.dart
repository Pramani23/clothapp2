import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'settings_page.dart';
import 'address_page.dart';
import 'checkout_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // 0 = Cash Payment, 1 = Digital Payment
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- TITLE ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 28),
                  ),

                  const SizedBox(width: 40),

                  const Text('Payment', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- PRODUCT ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 115,
                    child: Image.asset(
                      'assets/wishlist3.png',
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

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Western top',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        const Text('\$450', style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 3),
                        const Text('M', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),

                  const Icon(Icons.favorite_border, size: 20),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ---------------- SHIPPING ADDRESS ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Shipping Addresss',
                    style: TextStyle(fontSize: 13),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    color: const Color(0xFFE0E0E0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Add Address',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ---------------- PAYMENT OPTIONS ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Text('Payment', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = 0;
                      });
                    },
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: selectedPayment == 0
                          ? Colors.blue
                          : const Color(0xFFD9D9D9),
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text('Cash Payment', style: TextStyle(fontSize: 10)),

                  const SizedBox(width: 25),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = 1;
                      });
                    },
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: selectedPayment == 1
                          ? Colors.blue
                          : const Color(0xFFD9D9D9),
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text('Digital Payment', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ---------------- CHECKOUT ----------------
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                color: const Color(0xFFC8B1C8),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CheckoutPage()),
                    );
                  },
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ---------------- BOTTOM NAVIGATION ----------------
      bottomNavigationBar: _bottomNav(context),
    );
  }

  // ---------------- BOTTOM NAV (same style as other pages) ----------------
  Widget _bottomNav(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            child: const Text('🛍️', style: TextStyle(fontSize: 21)),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: const Icon(Icons.person, size: 27, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

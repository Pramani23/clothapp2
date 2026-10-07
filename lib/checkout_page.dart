import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'cart_page.dart';
import 'confirm_order_page.dart';
import 'home_page.dart';
import 'wishlist_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // 0 = Credit/Debit Card, 1 = UPI, 2 = Cash on Delivery
  int selectedMethod = 2;

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final apartmentController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    apartmentController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---------------- TITLE ----------------
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, size: 26),
                    ),

                    const SizedBox(width: 40),

                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // ---------------- DELIVERY ADDRESS ----------------
                const Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                greyField(fullNameController, 'FullName'),
                greyField(phoneController, 'Phone Number'),
                greyField(addressController, 'Address'),
                greyField(apartmentController, 'Apartment,suite,etc(optional)'),

                Row(
                  children: [
                    Expanded(
                      child: greyField(cityController, 'City'),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: greyField(pincodeController, 'Pincode'),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ---------------- PAYMENT METHOD ----------------
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                paymentOption(0, Icons.credit_card, 'Credit/Debit Card'),
                paymentOption(1, null, 'UPI'),
                paymentOption(2, null, 'Cash on Delivery'),

                const SizedBox(height: 25),

                // ---------------- PRICE DETAILS ----------------
                Center(
                  child: Column(
                    children: [
                      priceRow('Subtotal', '\$450'),
                      priceRow('Shipping', '\$49'),

                      const SizedBox(height: 10),

                      priceRow('Total', '\$499'),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ---------------- PLACE ORDER ----------------
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    color: const Color(0xFFC8B1C8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ConfirmOrderPage()),
                        );
                      },
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
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

            const Text('🛍️', style: TextStyle(fontSize: 21)),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: const Icon(Icons.person, size: 27, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- GREY FIELD ----------------
  Widget greyField(TextEditingController controller, String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      color: const Color(0xFFD9D9D9),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 11, color: Colors.black54),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 10, color: Colors.black54),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  // ---------------- PAYMENT OPTION ----------------
  Widget paymentOption(int index, IconData? icon, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        color: const Color(0xFFD9D9D9),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14),
              const SizedBox(width: 6),
            ],

            Text(
              title,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- PRICE ROW ----------------
  Widget priceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              label,
              style: const TextStyle(fontSize: 11),
            ),
          ),

          SizedBox(
            width: 50,
            child: Text(
              value,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

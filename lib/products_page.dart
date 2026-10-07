import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'wishlist_page.dart';
import 'categories_page.dart';
import 'products_page.dart';
import 'home_page_1.dart';
import 'cart_page.dart';
import 'checkout_page.dart';
import 'payment_page.dart';
import 'address_page.dart';
import 'confirm_order_page.dart';
import 'order_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // ================= LEFT SIDEBAR =================
          Container(
            width: 105,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LUXE Logo
                const Padding(
                  padding: EdgeInsets.only(
                    left: 7,
                    top: 15,
                    bottom: 14,
                  ),
                  child: Text(
                    "LUXE",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Divider(height: 1),

                const SizedBox(height: 12),

                _sideMenu("Dashboard"),
                _sideMenu("Products", selected: true),
                _sideMenu("Category"),
                _sideMenu("Payment"),
                _sideMenu("profile"),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 12,
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.pink.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ================= MAIN AREA =================
          Expanded(
            child: Column(
              children: [
                // ---------- TOP HEADER ----------
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 55),

                      const Text(
                        "All Products",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      // Add Product button
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add Product action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade50,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            minimumSize: const Size(87, 27),
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            "Add Product",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ---------- PRODUCT TABLE ----------
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 2,
                          top: 8,
                        ),
                        width: 310,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.grey.shade300,
                            width: 0.7,
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(52),
                            1: FixedColumnWidth(45),
                            2: FixedColumnWidth(45),
                            3: FixedColumnWidth(45),
                            4: FixedColumnWidth(70),
                          },
                          children: [
                            // Header
                            _tableHeader(),

                            // Product 1
                            _productRow(
                              image: "assets/product1.png",
                              name: "West\nGown",
                              category: "Gown",
                              price: "\$400",
                              size: "XL",
                            ),

                            // Product 2
                            _productRow(
                              image: "assets/product2.png",
                              name: "Tunic\ntop",
                              category: "Top",
                              price: "\$250",
                              size: "M",
                            ),

                            // Product 3
                            _productRow(
                              image: "assets/product3.png",
                              name: "Tunic\ntop",
                              category: "Top",
                              price: "\$450",
                              size: "M",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ---------- FOOTER ----------
                Container(
                  height: 28,
                  alignment: Alignment.center,
                  child: const Text(
                    "© 2026 Fashion Store. All Rights Reserved.",
                    style: TextStyle(
                      fontSize: 7,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= SIDEBAR MENU =================

  static Widget _sideMenu(
    String title, {
    bool selected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 7,
        top: 4,
        bottom: 4,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 9,
          color: selected
              ? Colors.pink.shade700
              : Colors.black,
        ),
      ),
    );
  }

  // ================= TABLE HEADER =================

  static TableRow _tableHeader() {
    return const TableRow(
      children: [
        _HeaderCell("Product"),
        _HeaderCell("Category"),
        _HeaderCell("Price"),
        _HeaderCell("Size"),
        _HeaderCell("Action"),
      ],
    );
  }

  // ================= PRODUCT ROW =================

  static TableRow _productRow({
    required String image,
    required String name,
    required String category,
    required String price,
    required String size,
  }) {
    return TableRow(
      children: [
        // Product
        SizedBox(
          height: 48,
          child: Row(
            children: [
              Container(
                width: 25,
                height: 38,
                margin: const EdgeInsets.only(left: 2),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return const Icon(
                      Icons.image,
                      size: 18,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 7,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Category
        _dataCell(category),

        // Price
        _dataCell(price),

        // Size
        _dataCell(size),

        // Actions
        SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Edit product
                },
                child: const Text(
                  "✎",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(width: 7),

              GestureDetector(
                onTap: () {
                  // Delete product
                },
                child: const Text(
                  "✕",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _dataCell(String text) {
    return SizedBox(
      height: 48,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 8,
          ),
        ),
      ),
    );
  }
}

// ================= HEADER CELL =================

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({super.key});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController =
      TextEditingController(text: "Western Top");

  final categoryController =
      TextEditingController(text: "Top");

  final sizeController =
      TextEditingController(text: "M");

  final priceController =
      TextEditingController(text: "\$450");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ---------------- SIDEBAR ----------------
          Container(
            width: 150,
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "LUXE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Divider(),

                _menuItem("Dashboard"),
                _menuItem("Products"),
                _menuItem("Category"),
                _menuItem("Payment"),
                _menuItem("Profile"),

                const Spacer(),

                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ---------------- MAIN CONTENT ----------------
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Edit Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        // Product image and name
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Image.asset(
                                "assets/product.png",
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image,
                                    size: 40,
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Women's New Fashion",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  IconButton(
                                    onPressed: () {
                                      // Delete image/product
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Description
                        _fieldTitle("Description"),
                        _textField(
                          descriptionController,
                          validator: (value) =>
                              _required(value, 'Description'),
                        ),

                        const SizedBox(height: 12),

                        // Category
                        _fieldTitle("Category Name"),
                        _textField(
                          categoryController,
                          validator: (value) =>
                              _required(value, 'Category name'),
                        ),

                        const SizedBox(height: 12),

                        // Size
                        _fieldTitle("Size"),
                        _textField(
                          sizeController,
                          validator: (value) => _required(value, 'Size'),
                        ),

                        const SizedBox(height: 12),

                        // Price
                        _fieldTitle("Price"),
                        _textField(
                          priceController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            final price = value?.replaceAll(
                              RegExp(r'[^0-9.]'),
                              '',
                            );
                            if (price == null || price.isEmpty) {
                              return 'Please enter a price';
                            }
                            if (double.tryParse(price) == null ||
                                double.parse(price) <= 0) {
                              return 'Enter a valid price';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Update button
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Category updated successfully!",
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade100,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 12,
                              ),
                            ),
                            child: const Text(
                              "Update Category",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Footer
                const SizedBox(
                  height: 35,
                  child: Center(
                    child: Text(
                      "© 2026 Fashion Store. All Rights Reserved.",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
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

  // Sidebar item
  static Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 9,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: title == "Category"
              ? Colors.black
              : Colors.grey.shade700,
        ),
      ),
    );
  }

  // Field title
  static Widget _fieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Text field
  static Widget _textField(
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: InputBorder.none,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
      ),
    );
  }

  static String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $label';
    }
    return null;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    categoryController.dispose();
    sizeController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
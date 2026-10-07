import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'settings_page.dart';
import 'address_page.dart';
import 'checkout_page.dart';


class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Shree');
  final addressController = TextEditingController(
    text: 'abc,block no 1,Rajkot',
  );
  final cityController = TextEditingController(text: 'Rajkot');
  final pincodeController = TextEditingController(text: '000000');
  final stateController = TextEditingController(text: 'Gujrat');
  bool saveAddress = false;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    stateController.dispose();
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                // ---------------- HEADER ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, size: 26),
                          SizedBox(width: 8),
                          Text(
                            'LUXE',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'x',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ---------------- TITLE ----------------
                const Text('Select Address', style: TextStyle(fontSize: 20)),

                const SizedBox(height: 25),

                // ---------------- FULL NAME ----------------
                fieldLabel('Full Name'),
                greyField(
                  nameController,
                  validator: (value) => _required(value, 'Full name'),
                ),

                const SizedBox(height: 18),

                // ---------------- ADDRESS ----------------
                fieldLabel('Address'),
                greyField(
                  addressController,
                  validator: (value) => _required(value, 'Address'),
                ),

                const SizedBox(height: 18),

                // ---------------- CITY ----------------
                fieldLabel('City'),
                greyField(
                  cityController,
                  validator: (value) => _required(value, 'City'),
                ),

                const SizedBox(height: 18),

                // ---------------- PINCODE + STATE ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldLabel('Pincod'),
                        SizedBox(
                          width: 90,
                          child: greyField(
                            pincodeController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter pincode';
                              }
                              if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
                                return 'Use 6 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldLabel('State'),
                        SizedBox(
                          width: 90,
                          child: greyField(
                            stateController,
                            validator: (value) => _required(value, 'State'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // ---------------- SAVE CHECKBOX ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: saveAddress,
                      onChanged: (value) {
                        setState(() {
                          saveAddress = value ?? false;
                        });
                      },
                    ),

                    const Text(
                      'Save this Address',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // ---------------- SAVE BUTTON ----------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  color: const Color(0xFFC8B1C8),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Address saved!')),
                        );
                      }
                    },
                    child: const Text(
                      'Save Address',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                ],
              ),
            ),
          ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: const Text('🛍️', style: TextStyle(fontSize: 21)),
            ),

            const Icon(Icons.person, size: 27, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }

  // ---------------- FIELD LABEL ----------------
  Widget fieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }

  // ---------------- GREY FIELD ----------------
  Widget greyField(
    TextEditingController controller, {
    required String? Function(String?) validator,
  }) {
    return Container(
      color: const Color(0xFF9E9E9E),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: const TextStyle(fontSize: 12, color: Colors.black54),
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          errorStyle: TextStyle(color: Colors.red, fontSize: 11),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $label';
    }
    return null;
  }
}

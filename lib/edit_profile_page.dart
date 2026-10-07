import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController(text: "XYZ");
  final usernameController = TextEditingController(text: "Admin");
  final emailController = TextEditingController(text: "XYZ@gmail.com");
  final genderController = TextEditingController(text: "Female");
  final mobileController = TextEditingController(text: "4573282907");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ---------------- SIDEBAR ----------------
          Container(
            width: 150,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "LUXE",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 12, color: Colors.red),
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
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Edit profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Profile content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile image + Edit Profile button
                        Row(
                          children: [
                            Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pink.shade50,
                                border: Border.all(
                                  color: Colors.pink.shade300,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.person_outline,
                                size: 45,
                                color: Colors.pink.shade400,
                              ),
                            ),

                            const SizedBox(width: 25),

                            ElevatedButton(
                              onPressed: () {
                                // Edit profile image
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink.shade100,
                                foregroundColor: Colors.black,
                                elevation: 0,
                              ),
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        _profileText("Name", nameController.text),

                        _profileText("Username", usernameController.text),

                        _profileText("Email ID", emailController.text),

                        _profileText("Gender", genderController.text),

                        _profileText("Mobile Number", mobileController.text),

                        const SizedBox(height: 15),

                        // Edit Information button
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              _showEditDialog();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade100,
                              foregroundColor: Colors.black,
                              elevation: 0,
                            ),
                            child: const Text(
                              "Edit Information",
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer
                const SizedBox(
                  height: 35,
                  child: Center(
                    child: Text(
                      "© 2026 Fashion Store. All Rights Reserved.",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
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

  // Sidebar menu
  static Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: title == "Profile" ? Colors.black : Colors.grey.shade700,
        ),
      ),
    );
  }

  // Profile information
  static Widget _profileText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          children: [
            TextSpan(
              text: "$title : ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  // Edit information dialog
  void _showEditDialog() {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Information"),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _dialogField("Name", nameController),
                  _dialogField("Username", usernameController),
                  _dialogField("Email", emailController),
                  _dialogField("Gender", genderController),
                  _dialogField("Mobile Number", mobileController),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  static Widget _dialogField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: (value) => _validateProfileValue(label, value),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        ),
      ),
    );
  }

  static String? _validateProfileValue(String label, String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter ${label.toLowerCase()}';
    }
    if (label == 'Email' &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    if (label == 'Mobile Number' &&
        !RegExp(r'^\d{10}$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit number';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    genderController.dispose();
    mobileController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';


class ConfirmOrderPage extends StatelessWidget {
  const ConfirmOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ---------------- SUCCESS ICON ----------------
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC46B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ---------------- MESSAGE ----------------
              const Text(
                'Congratulation',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const Text(
                'your order placed!!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 35),

              // ---------------- BUTTONS ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  purpleButton(
                    'Logout',
                    () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                  ),

                  const SizedBox(width: 25),

                  purpleButton(
                    'Cancle',
                    () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // ---------------- SMALL ICON ----------------
              const Icon(
                Icons.shopping_bag_outlined,
                size: 22,
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- PURPLE BUTTON ----------------
  Widget purpleButton(String title, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      color: const Color(0xFFC8B1C8),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

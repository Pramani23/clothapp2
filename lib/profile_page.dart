import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 22,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'LUXE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Greeting
                    const Text(
                      'Hello Shreena !!',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Profile icon
                    Container(
                      width: 78,
                      height: 78,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF9418),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 65,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Menu
                    const ProfileMenuItem(
                      icon: '🖉',
                      title: 'Edit profile',
                    ),

                    const ProfileMenuItem(
                      icon: 'ℹ️',
                      title: 'About US',
                    ),

                    const ProfileMenuItem(
                      icon: '📦',
                      title: 'My Order',
                    ),

                    const ProfileMenuItem(
                      icon: '♡',
                      title: 'My Wislist',
                    ),

                    const ProfileMenuItem(
                      icon: '↪',
                      title: 'Logout',
                    ),
                  ],
                ),
              ),
            ),

            // Bottom navigation
            Container(
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 1,
                  ),
                ),
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '🏠',
                    style: TextStyle(fontSize: 22),
                  ),

                  const Text(
                    '♡',
                    style: TextStyle(fontSize: 30),
                  ),

                  const Icon(
                    Icons.grid_view,
                    size: 25,
                  ),

                  const Text(
                    '🛍️',
                    style: TextStyle(fontSize: 22),
                  ),

                  const Text(
                    '👤',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Reusable menu item
class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 20,
        bottom: 15,
      ),

      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              icon,
              style: const TextStyle(
                fontSize: 21,
              ),
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
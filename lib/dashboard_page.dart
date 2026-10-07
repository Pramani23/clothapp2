import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 150,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
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

                // Menu
                _menuItem("Dashboard"),
                _menuItem("Products"),
                _menuItem("Category"),
                _menuItem("Payment"),
                _menuItem("Profile"),

                const Spacer(),

                // Logout
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Dashboard
          Expanded(
            child: Column(
              children: [
                // Top Header
                Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      const Text(
                        "Admin",
                        style: TextStyle(fontSize: 13),
                      ),

                      const SizedBox(width: 5),

                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                // Dashboard Content
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            _dashboardCard(
                              title: "Total Orders",
                              value: "20",
                              icon: Icons.shopping_bag_outlined,
                            ),

                            const SizedBox(width: 20),

                            _dashboardCard(
                              title: "Total Customers",
                              value: "2",
                              icon: Icons.people_outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer
                Container(
                  height: 35,
                  alignment: Alignment.center,
                  child: const Text(
                    "© 2026 Fashion Store. All Rights Reserved.",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
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

  // Sidebar menu item
  static Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: title == "Dashboard"
              ? Colors.black
              : Colors.grey.shade700,
        ),
      ),
    );
  }

  // Dashboard card
  static Widget _dashboardCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      width: 220,
      height: 130,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.grey.shade700,
          ),

          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
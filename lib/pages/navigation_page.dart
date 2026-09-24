import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:siply/pages/cart_page.dart';
import 'package:siply/pages/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

int _selectedIndex = 0;

final List _screens = [HomePage(), CartPage()];

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,

      body: _screens[_selectedIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white70,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              gap: 8,
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 55,
                vertical: 15,
              ),
              tabBackgroundColor: const Color.fromARGB(255, 42, 81, 148),
              selectedIndex: _selectedIndex,
              onTabChange: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  iconColor: Colors.grey.shade600,
                  iconActiveColor: Colors.white,
                  text: "Home",
                  iconSize: 25,
                  textColor: Colors.white,
                ),

                GButton(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.grey.shade700,
                  iconActiveColor: Colors.white,
                  iconSize: 25,
                  text: "Cart",
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

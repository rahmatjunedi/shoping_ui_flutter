import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_ui_flutter/eccomerce_page_home.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
      EccomerceHomeScreen(),
      navBarPage(Icons.location_on),
      navBarPage(Icons.person),
      navBarPage(Icons.shopping_cart)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: GNav(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          color: Colors.orange,
          textStyle:
              TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          tabBackgroundColor: Colors.orange[50]!,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.share_location,
              text: "Location",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.person,
              text: "Profil",
              iconSize: 30,
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
              iconSize: 30,
            )
          ],
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: page[selectedIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: Colors.black,
      ),
    );
  }
}

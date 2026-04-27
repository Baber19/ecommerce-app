import 'package:flutter/material.dart';

import 'nav_pages/nav_cart_page.dart';
import 'nav_pages/nav_home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedNavIndex = 0;

  List<Widget> navPages = [
    NavHomePage(),
    NavCartPage(),
    NavHomePage(),
    NavCartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedNavIndex],
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 10,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                selectedNavIndex = 0;
                setState(() {});
              },
              icon: Icon(Icons.category_outlined, color: Colors.grey, size: 30),
            ),
            IconButton(
              onPressed: () {
                selectedNavIndex = 1;
                setState(() {});
              },
              icon: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
            ),

            SizedBox(width: 80),
            IconButton(
              onPressed: () {
                selectedNavIndex = 2;
                setState(() {});
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                selectedNavIndex = 3;
                setState(() {});
              },
              icon: Icon(Icons.person_2_outlined, color: Colors.grey, size: 30),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(51),
          ),

          onPressed: () {},
          child: Icon(Icons.home, color: Colors.white70, size: 30),
        ),
      ),
    );
  }
}

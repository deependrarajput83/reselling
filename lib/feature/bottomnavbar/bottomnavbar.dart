import 'package:flutter/material.dart';

import '../homepage/view/homemainpage.dart';
import '../orders/view/orderpagemainscreen.dart';
import '../products/view/productmainscreen.dart';
import '../profile/view/profilemainpage.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int myindex = 0;

  final List<String> icons = [
    "image/svgicon/homeicon.png",
    "image/svgicon/beg.png",
    "image/svgicon/cart.png",
    "image/svgicon/person.png",
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeMainPage(isActive: myindex == 0),
      ProductMainScreen(isActivep: myindex == 1),
      OrderPageMainScreen(isactiveorder: myindex == 2),
      ProfileMainPage(IsactiveProfilePage: myindex == 3),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: myindex, children: pages),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            icons.length,
            (index) => Expanded(child: navItem(index)),
          ),
        ),
      ),
    );
  }

  Widget navItem(int index) {
    bool isSelected = myindex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          myindex = index;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSelected ? 45 : 0,
            height: 6,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: isSelected ? 1.2 : 1,
            child: Image.asset(
              icons[index],
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

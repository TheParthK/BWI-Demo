import 'dart:ui';

import 'package:bwi_demo2/Pages/category_page.dart';
import 'package:bwi_demo2/Pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;

  void goToHome(){
    setState(() {
      currentPage = 0;
    });
  }
  void goToCat(){
    setState(() {
      currentPage = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Stack(
        children: [
          currentPage == 0 ? 
            const HomePage() : 
            const CategoryPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 35, sigmaY: 10),
                  child: Container(
                    width: double.infinity,
                    height: devicePadding.top,
                    color: ThemeData.light().scaffoldBackgroundColor.withAlpha(150),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: devicePadding.bottom + 50,
                padding: EdgeInsets.only(bottom: devicePadding.bottom + 5, left: 5, right: 5, top: 5),
                decoration: BoxDecoration(
                  color: ThemeData.light().scaffoldBackgroundColor,
                  border: Border(top: BorderSide(color: Colors.black.withAlpha(15), width: 1))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavBarButton(icon: Icons.home_rounded, onTap: goToHome, active: currentPage == 0 ? true : false),
                    BottomNavBarButton(icon: Icons.category_rounded, onTap: goToCat, active: currentPage == 1 ? true : false),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BottomNavBarButton extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback onTap;
  const BottomNavBarButton({super.key, required this.icon, required this.onTap, required this.active});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 30,
          color: Colors.black.withAlpha(active?225:45),
        ),
      ),
    );
  }
}
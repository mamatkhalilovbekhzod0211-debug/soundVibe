import 'package:flutter/material.dart';
import 'package:native_glass_navbar/native_glass_navbar.dart';
import 'package:liquid_glass_bottom_bar/liquid_glass_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // glass effekt uchun
      bottomNavigationBar: LiquidGlassBottomBar(
        items: [
          LiquidGlassBottomBarItem(icon: Icons.home, label: 'Home'),
          LiquidGlassBottomBarItem(icon: Icons.search, label: 'Search'),
          LiquidGlassBottomBarItem(icon: Icons.person, label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        activeColor: Colors.blueAccent,
        barBlurSigma: 16,
        activeBlurSigma: 24,
      ),
    );
  }
}

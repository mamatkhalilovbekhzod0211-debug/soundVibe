import 'dart:ui';
import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Размытие
          child: Container(
            height: 60,
            width: 240,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.35), // Полупрозрачный темный фон
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon("assets/app_images/ic_home.png"),
                _buildIcon("assets/app_images/ic_menu.png"),
                _buildIcon("assets/app_images/img_vibe.png"),
                _buildIcon("assets/app_images/ic_profile.png")
              ],
            ),
          ),
        ));
  }

  // Метод для обычной белой иконки
  Widget _buildIcon(String icon) {
    return Image.asset(icon, color: Colors.white, width: 24,height: 24,);
  }

  // Метод для иконки с градиентом (как синий домик)
  Widget _buildGradientIcon(String icon, bool isActive) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blueAccent, Colors.purpleAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Image.asset(icon, color: Colors.white, width: 30,height: 30,),
    );
  }

  // Метод для центральной круглой кнопки с градиентным фоном
  Widget _buildSpecialIcon() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(Icons.auto_awesome, color: Colors.white, size: 24),
    );
  }
}
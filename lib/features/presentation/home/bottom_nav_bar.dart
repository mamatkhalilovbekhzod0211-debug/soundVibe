import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingNavBar extends StatefulWidget {
  FloatingNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Размытие
        child: Container(
          height: 70,
          width: 240,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xFF4E4C4C).withOpacity(0.2),
            // Полупрозрачный темный фон
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon("assets/app_images/ic_home.png","assets/app_images/ic_home_selected.png", 0),
              _buildIcon("assets/app_images/ic_menu.png","assets/app_images/ic_menu_selected.png" ,1),
              _buildIcon("assets/app_images/img_vibe.png","assets/app_images/img_vibe.png",2),
              _buildIcon("assets/app_images/ic_profile.png","assets/app_images/ic_profile_selected.png",3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String icon,String selectedIcon, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF221C1A) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            isSelected?selectedIcon:icon,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  // Метод для иконки с градиентом (как синий домик)
  Widget _buildSelectedIcon(String icon) {
    return Image.asset(icon, color: Colors.white, width: 24, height: 24);
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Размытие
        child: Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFF4E4C4C).withOpacity(0.2),
            // Полупрозрачный темный фон
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              "assets/app_images/ic_add.svg",
              color: Colors.white,
              width: 16,
              height: 16,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:saundvibe/core/constants/app_colors.dart';

class SimpleGrayTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const SimpleGrayTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color:  AppColors.white10,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFF363636),
          width: 1,
        ),
      ),
      child: TextField(

        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(
          color: AppColors.cA3A3A3,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.cA3A3A3,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 19,
            vertical: 12.5,
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/core/constants/app_colors.dart';
import 'package:saundvibe/core/constants/app_svg.dart';
import 'package:saundvibe/core/widgets/animated_button.dart';

class LiquidGlassButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;
  final Color glassColor;

  const LiquidGlassButton({
    Key? key,
    required this.text,
    this.icon,
    this.onPressed,
    this.height = 56,
    this.borderRadius = 28,
    this.glassColor = AppColors.white10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: AnimatedButton(
          onTap: () {},
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.white10,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(borderRadius),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 80),
                      SvgPicture.asset(AppSvg.googleLogo),
                      SizedBox(width: 8,),
                      Text(
                        text,
                        style: const TextStyle(
                          color: Color(0xFFB0B0B0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saundvibe/core/constants/app_colors.dart';
import 'package:saundvibe/core/constants/app_svg.dart';
import 'package:saundvibe/core/enum/button_enum.dart';

import 'button.dart';
import 'button2.dart';

class MorphAuthButton extends StatelessWidget {
  final AuthButtonMode state;
  final VoidCallback onSignIn;
  final VoidCallback onGoogle;

  const MorphAuthButton({
    super.key,
    required this.state,
    required this.onSignIn,
    required this.onGoogle,
  });

  @override
  Widget build(BuildContext context) {
    final isGoogle = state == AuthButtonMode.googleRegister;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      // width: isGoogle ? 260 : 200,
      height: 70,
      // decoration: BoxDecoration(
      //   gradient: isGoogle
      //       ? null
      //       : LinearGradient(
      //     colors: [
      //       AppColors.cFF04C3FE,
      //       AppColors.cFF04C3FF,
      //       AppColors.c3A79F6,
      //     ],
      //   ),
      //   color: isGoogle ? Colors.white.withOpacity(0.08) : null,
      //   borderRadius: BorderRadius.circular(isGoogle ? 40 : 45),
      //   border: isGoogle
      //       ? Border.all(color: Colors.white.withOpacity(0.2))
      //       : null,
      // ),
      child: isGoogle ? _glassContent() : _signInContent(),
    );
  }


  Widget _signInContent() {
    return GradientButton(text: 'SignIn',onPressed: onSignIn,);
  }


  Widget _glassContent() {
    return LiquidGlassButton(text: "", onPressed: onGoogle,);
  }
}

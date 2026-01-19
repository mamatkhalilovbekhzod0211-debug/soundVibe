import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/core/constants/app_colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;

  const GradientText({
    Key? key,
    required this.text,
    this.style,
    this.colors = const [
      AppColors.cFF04C3FE,
      AppColors.c3A79F6,
      AppColors.c3A79F6,
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
      ).createShader(bounds),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ??
            TextStyle(color: Colors.white),
      ),
    );
  }
}

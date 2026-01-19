import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/core/constants/app_colors.dart';
import 'package:saundvibe/core/widgets/animated_button.dart';

import 'dialog.dart';

class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;

  const GradientButton({Key? key, required this.text, this.onPressed, this.height = 56, this.borderRadius = 28})
    : super(key: key);

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> with TickerProviderStateMixin {
  late AnimationController _pressController;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedButton(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black.withOpacity(0.4),
            builder: (_) => CustomDialog(
              title: 'O‘chirish',
              description: 'Rostdan ham o‘chirmoqchimisiz?',
              onConfirm: () {
                print('Confirmed');
              },
            ),
          );
        },
        child: Container(
          width: 194,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFB7F7F6),
                Color(0xFFAD3A90),
                Color(0xFF7E42E0),
              ],
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

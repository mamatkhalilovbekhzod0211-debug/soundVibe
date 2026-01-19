import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:saundvibe/core/widgets/animated_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          /// BLUR + GLASS
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0x1111111A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [

                        const SizedBox(width: 12),
                        Expanded(
                          child: _DialogButton(
                            text: 'Create new account',
                            isPrimary: true,
                            onTap: () {
                              Navigator.pop(context);
                              onConfirm();
                            },
                          ),
                        ),  Expanded(
                          child: _DialogButton2(
                            text: 'Ok',
                            isPrimary: true,
                            onTap: () {
                              Navigator.pop(context);
                              onConfirm();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;

  const _DialogButton({
    required this.text,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0x1111114D),
          borderRadius: BorderRadius.circular(30),
          border: isPrimary
              ? Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          )
              : null,
          gradient: isPrimary ? soundVibeGradient : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

}class _DialogButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isPrimary;

  const _DialogButton2({
    required this.text,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0x1111114D),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          )
             ,
          gradient: soundVibeGradient,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

const soundVibeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFB7F7F6),
    Color(0xFFAD3A90),
    Color(0xFF7E42E0),
  ],
);
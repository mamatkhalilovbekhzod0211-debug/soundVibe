
// 2. OR Divider (OR chizig'i)
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;

  const OrDivider({
    Key? key,
    this.text = 'OR',
    this.lineColor = const Color(0xFF404040),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: lineColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}

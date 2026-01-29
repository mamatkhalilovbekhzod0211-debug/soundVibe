import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/features/presentation/home/tuned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Smile extends StatefulWidget {
  const Smile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SmileState();
  }
}

class _SmileState extends State<Smile> {
  Widget buildSmile({required String text,required String icon1, required String? icon2}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFF221C1A),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          icon1.contains("svg")
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SvgPicture.asset(
                    icon1.toString(),
                    width: 24,
                    height: 24,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset(icon1.toString(), width: 24, height: 24),
                ),

          if (icon2 != null)
            icon2.contains("svg")
                ? Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SvgPicture.asset(
                      icon1.toString(),
                      width: 24,
                      height: 24,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Image.asset(icon2.toString(), width: 24, height: 24),
                  ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 13),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: double.infinity,
          height: 600,
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: Color(0xFF3A3937).withOpacity(0.3),
            borderRadius: BorderRadius.circular(35),
          ),
          child: ListView.separated(
            itemCount: 12,
            itemBuilder: (context, index) {
              if (index == 0) {
                return buildSmile(
                  text: "5+",
                  icon1: "assets/app_images/ic_happy.svg",
                  icon2: "assets/app_images/ic_smile.svg",
                );
              } else if (index == 1) {
                return SizedBox(height: 32);
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserBadge(),
                    buildSmile(
                      text: "Soft 1+",
                      icon1: "assets/app_images/ic_happy.svg",
                      icon2: null,)
                  ],
                );
              }
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 12);
            },
          ),
        ),
      ),
    );
  }
}

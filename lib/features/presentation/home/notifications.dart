import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Размытие
        child: Container(
          height: 60,
          width: 380,
          decoration: BoxDecoration(
            color: Color(0xFF4E4C4C).withOpacity(0.2),
            // Полупрозрачный темный фон
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon("assets/app_images/img_vibe.png",null, "66+"),
                _buildIcon("assets/app_images/ic_happy.svg","assets/app_images/ic_smile.svg" ,"5+"),
                _buildIcon("assets/app_images/img_comment.png",null,"245+"),
                _buildIcon(null,null,"300+ Tuned"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String? icon1,String? icon2, String text) {

    return GestureDetector(
      onTap: () {

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 96,
        height: 48,
        decoration: BoxDecoration(
          color:  Color(0xFF221C1A) ,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [

             if(icon1 != null)
               icon1.contains("svg")? Padding(
                 padding: const EdgeInsets.only(
                   left: 12
                 ),
                 child: SvgPicture.asset(
                   icon1.toString(),
                   width: 24,
                   height: 24,
                 ),
               )
                   :
               Padding(
                 padding: const EdgeInsets.only(
                   left: 12
                 ),
                 child: Image.asset(
                   icon1.toString(),
                   width: 24,
                   height: 24,
                 ),
               ),

            if(icon2!=null)
             icon2.contains("svg")? Padding(
               padding: const EdgeInsets.only(
                 left: 12
               ),
               child: SvgPicture.asset(
                 icon1.toString(),
                 width: 24,
                 height: 24,
               ),
             )
             :
             Padding(
               padding: const EdgeInsets.only(
                 left: 12
               ),
               child: Image.asset(
                 icon2.toString(),
                 width: 24,
                 height: 24,
               ),
             ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12
                ),
                child: Text(
                    text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  ),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // Метод для иконки с градиентом (как синий домик)
  Widget _buildSelectedIcon(String icon) {
    return Image.asset(icon, color: Colors.white, width: 24, height: 24);
  }
}
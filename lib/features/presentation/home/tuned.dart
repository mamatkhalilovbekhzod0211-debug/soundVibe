import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tuned extends StatefulWidget{
  const Tuned({super.key});

  @override
  State<StatefulWidget> createState()  => _TunedState();

}

class _TunedState extends State<Tuned> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(35),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: double.infinity,
          height: 350,
          padding: EdgeInsets.only(
            left: 16,
            right: 16
          ),
          decoration: BoxDecoration(
            color: Color(0xFF3A3937).withOpacity(0.3),
            borderRadius: BorderRadius.circular(35)

          ),
          child: ListView.separated(
            itemCount:6,
              itemBuilder: (context,index){
                if(index == 0){
                  return TunedBadge(
                    text: "300+ Tuned",
                  );
                }
                else if(index == 1){
                  return SizedBox(
                    height: 32,
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserBadge(),
                      TunedBadge(
                          text: "Tunengs",
                      ),
                    ],
                  );
                }
          },
            separatorBuilder: (context,index){
              return SizedBox(
                height: 12,
              );
            },
          ),
        ),
      ),
    );
  }

}

class TunedBadge extends StatelessWidget {
  TunedBadge({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 96,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF221C1A),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    height: 1,
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
}


class UserBadge extends StatelessWidget {
  const UserBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gradient avatar border
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF2D55),
                  Color(0xFFFF9500),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=47",
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Sara Beri",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "@saraberi",
                style: TextStyle(
                  height: 1,
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
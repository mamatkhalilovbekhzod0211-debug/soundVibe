import 'package:flutter/cupertino.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Comments extends StatefulWidget{
  const Comments({super.key});

  @override
  State<StatefulWidget> createState()  => _CommentsState();

}

class _CommentsState extends State<Comments> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(35),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.only(
              left: 16,
              right: 16
          ),
          decoration: BoxDecoration(
              color: Color(0xFF3A3937).withOpacity(0.3),
              borderRadius: BorderRadius.circular(35)

          ),
          child: ListView.separated(
            itemCount:7,
            itemBuilder: (context,index){
              if(index == 0){
                return _CommentsBadge(
                  text: "245+",
                  icon: "assets/app_images/img_comment.png",
                );
              }
              else if(index == 1){
                return SizedBox(
                  height: 32,
                );
              } else {
                return Row(
                  children: [
                    UserBadge(),
                    SizedBox(
                      width: 16
                    ),
                    Expanded(
                        child: Container(
                          height: 50,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Spacer(),
                                  SvgPicture.asset("assets/app_images/ic_backward.svg"),
                                  Spacer()
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "5 sec ago",
                                    style:TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 13
                                    )
                                  ),
                                  Text(
                                      "What's up girls",
                                    style: TextStyle(
                                      color: Color(0xFFE5E5E5),
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    )
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

class _CommentsBadge extends StatelessWidget {
  const _CommentsBadge({required this.text, required this.icon});

  final String text, icon;

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
            icon.contains("svg") ? Padding(
              padding: const EdgeInsets.only(
                  left: 12
              ),
              child: SvgPicture.asset(
                icon.toString(),
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
                icon.toString(),
                width: 24,
                height: 24,
              ),
            ),
            Padding(
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

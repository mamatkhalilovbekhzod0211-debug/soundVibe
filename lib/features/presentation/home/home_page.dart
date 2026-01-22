import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/features/presentation/home/bottom_nav_bar.dart';

const bgColor = Color(0xFF0A0A0A);
const glassColor = Color(0x1AFFFFFF);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const TopBarExact(),
            const SizedBox(height: 14),
           const FeedExact(),
            const Spacer(),
            FloatingNavBar(),
          ],
        ),
      ),
    );
  }
}

class TopBarExact extends StatelessWidget {
  const TopBarExact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(1),
                  border: Border.all(color: Colors.white12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'SoundVibe',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(1),
              border: Border.all(color: Colors.white12),
            ),
            child: Image.asset(
              "assets/app_images/ic_search.png",
              width: 16,
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class FeedExact extends StatelessWidget {
  const FeedExact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          width: double.infinity,
          height: 464,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background image
                Image.asset(
                  'assets/app_images/img_superstar.png',
                  // <-- твоя картинка
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Gradient overlay
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Wish I Was Here    ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/app_images/img_music.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      // Bottom content
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Seller
                            Row(
                              children: [
                                SellerBadge(),
                                const Spacer(),
                                _actionButton(
                                  text: 'Buy',
                                  icon: Icons.shopping_cart,
                                  color: Colors.lightBlueAccent,
                                ),
                                const SizedBox(width: 10),
                                _actionButton(
                                  text: 'Tune',
                                  icon: null,
                                  color: Colors.lightBlueAccent,
                                ),
                                const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Text(
                                  'Adidas F50 boots',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.timer,
                                  size: 16,
                                  color: Colors.white70,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '1 hours ago',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Row(
                              children: const [
                                Text(
                                  '150\$',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Text(
                                  '...more',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 80
          ),
          child: Row(
            children: [
              _itemMenu(imgName: "assets/app_images/img_vibe.png", text: "Vibe"),

              Spacer(),
              _itemMenu(imgName: "assets/app_images/img_soft.png", text: "Soft"),

              SizedBox(
                width: 8,
              ),
              _itemMenu(imgName: "assets/app_images/img_comment.png", text: null),
              SizedBox(
                width: 8,
              ),
              _itemMenu(imgName: "assets/app_images/img_share.png", text: null)

            ],
          ),
        ),
      ],
    );
  }

  static Widget _itemMenu({required String imgName, required String? text}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(1),
            border: Border.all(color: Colors.white..withOpacity(0.35),width: 0.05),
            borderRadius: BorderRadius.circular(30),
          ),
          // margin: EdgeInsets.only(left: 16, top: 16),
          child: Row(
            children: [
              Image.asset(height: 24, width: 24, imgName),
              if (text != null) SizedBox(width: 4),
              Text(
                text ?? "",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _actionButton({
    required String text,
    required IconData? icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerBadge extends StatelessWidget {
  const SellerBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8FF3B),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'eShoper',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'eShoper',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '@eshoper',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


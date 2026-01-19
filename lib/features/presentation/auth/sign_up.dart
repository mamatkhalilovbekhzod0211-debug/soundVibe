import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saundvibe/core/constants/app_colors.dart';
import 'package:saundvibe/core/constants/app_svg.dart';
import 'package:saundvibe/core/widgets/animated_button.dart';
import 'package:saundvibe/core/widgets/button.dart';
import 'package:saundvibe/core/widgets/button2.dart';
import 'package:saundvibe/core/widgets/divider.dart';
import 'package:saundvibe/core/widgets/text_field.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:saundvibe/features/presentation/home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phoneOrEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void dispose() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 140),

            /// Logo
            ClipOval(child: Image.asset(AppSvg.appLogo, height: 45, width: 45, fit: BoxFit.cover)),
            const SizedBox(height: 16),

            /// Title
            SvgPicture.asset(AppSvg.soundVibe),

            const SizedBox(height: 40),

            /// Google button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LiquidGlassButton(text: 'Continue With Google'),
            ),

            const SizedBox(height: 25),

            /// OR divider
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: OrDivider()),

            const SizedBox(height: 25),

            /// Phone or Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SimpleGrayTextField(controller: phoneOrEmailController, hintText: 'Phone number or email'),
            ),

            const SizedBox(height: 15),

            /// Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SimpleGrayTextField(controller: passwordController, hintText: 'Password', obscureText: true),
            ),

            const SizedBox(height: 15),

            /// Full name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SimpleGrayTextField(controller: fullNameController, hintText: 'Fullname'),
            ),

            const SizedBox(height: 15),

            /// Username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SimpleGrayTextField(controller: usernameController, hintText: 'Username'),
            ),

            const SizedBox(height: 35),

            /// Sign Up button
            GradientButton(
              text: 'Sign up',

            ),

            const SizedBox(height: 50),

            /// Bottom divider
            Container(height: 0.5, color: AppColors.cA3A3A3),

            const SizedBox(height: 12),

            /// Have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account? ', style: TextStyle(color: AppColors.cA3A3A3)),
                AnimatedButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> Home()));
                  },
                  child: Text(
                    'Log in.',
                    style: TextStyle(color: Color(0xFF7E42E0), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

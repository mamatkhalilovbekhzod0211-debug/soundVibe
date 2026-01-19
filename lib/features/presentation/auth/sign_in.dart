import 'package:flutter/material.dart';
import 'package:saundvibe/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saundvibe/core/constants/app_svg.dart';
import 'package:saundvibe/core/widgets/animated_button.dart';
import 'package:saundvibe/core/widgets/auth_button_section.dart';
import 'package:saundvibe/core/widgets/button.dart';
import 'package:saundvibe/core/widgets/button2.dart';
import 'package:saundvibe/core/widgets/dialog.dart';
import 'package:saundvibe/core/widgets/divider.dart';
import 'package:saundvibe/core/widgets/gradient_text.dart';
import 'package:saundvibe/core/widgets/text_field.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:oc_liquid_glass/oc_liquid_glass.dart';
import 'package:saundvibe/features/presentation/auth/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 180),
                ClipOval(child: Image.asset(AppSvg.appLogo, height: 45, width: 45, fit: BoxFit.cover)),
                SizedBox(height: 20),
                SvgPicture.asset(AppSvg.soundVibe),
                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SimpleGrayTextField(hintText: 'Phone number , username or email'),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: SimpleGrayTextField(hintText: 'Password'),
                ),
                SizedBox(height: 20),
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: AnimatedButton(
                    onTap: () {},
                    child: GradientText(text: 'Forgot password?'),
                  ),
                ),
                SizedBox(height: 30),
                GradientButton(
                  text: 'LogIn',
                  onPressed: () {



                  },
                ),

                Padding(padding: const EdgeInsets.only(left: 15, right: 15, top: 30), child: OrDivider()),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: LiquidGlassButton(text: 'Continue With Google'),
                ),
                const SizedBox(height: 76),

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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        'Sign Up.',
                        style: TextStyle(color: Color(0xFF7E42E0), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:saundvibe/core/enum/button_enum.dart';

import 'auth_button.dart';

class AuthButtonsSection extends StatefulWidget {
  const AuthButtonsSection({super.key});

  @override
  State<AuthButtonsSection> createState() => _AuthButtonsSectionState();
}

class _AuthButtonsSectionState extends State<AuthButtonsSection> {
  AuthButtonMode _state = AuthButtonMode.signIn;

  void _toggle() {
    setState(() {
      _state = _state == AuthButtonMode.signIn
          ? AuthButtonMode.googleRegister
          : AuthButtonMode.signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// 🔘 ALOHIDA TUGMA
        ElevatedButton(
          onPressed: _toggle,
          child: const Text("Switch button type"),
        ),

        const SizedBox(height: 24),

        /// 🔥 ASOSIY BUTTON
        MorphAuthButton(
          state: _state,
          onSignIn: () => debugPrint("SIGN IN"),
          onGoogle: () => debugPrint("GOOGLE REGISTER"),
        ),
      ],
    );
  }
}

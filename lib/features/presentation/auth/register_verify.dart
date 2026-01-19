import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/features/presentation/auth/widgets/widgets.dart';


class RegisterVerify extends StatefulWidget{
  const RegisterVerify({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterVerifyState();
  }

}


class _RegisterVerifyState extends State<RegisterVerify>  with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  bool hasError = false;

  static const correctCode = "123456";

  @override
  void initState() {
    super.initState();

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);

    _controller.addListener(_onCodeChanged);
  }

  void _onCodeChanged() {
    if (_controller.text.length == 6) {
      _focusNode.unfocus();
      _validateCode();
    }
    setState(() {});
  }

  void _validateCode() async {
    if (_controller.text == correctCode) {
      /// ✅ AUTO NAVIGATION
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => const SuccessScreen(),
      //   ),
      // );
    } else {
      /// ❌ ERROR
      setState(() => hasError = true);
      _shakeController.forward(from: 0);

      await Future.delayed(const Duration(milliseconds: 600));
      _controller.clear();
      setState(() => hasError = false);
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final code = _controller.text;

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),

                const SizedBox(height: 24),

                const Text(
                  "Enter the confirmation code",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Enter the 6-digit code sent via WhatsApp to +998901234567",
                  style: TextStyle(color: Colors.white54),
                ),

                const SizedBox(height: 32),

                /// OTP + SHAKE
                AnimatedBuilder(
                  animation: _shakeAnimation,
                  builder: (context, child) {
                    final offset =
                        sin(_shakeAnimation.value * pi * 4) * 10;
                    return Transform.translate(
                      offset: Offset(offset, 0),
                      child: child,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      final filled = index < code.length;

                      Color borderColor;
                      Color fillColor;

                      if (hasError) {
                        borderColor = Colors.red;
                        fillColor = Colors.red.withOpacity(0.2);
                      } else if (filled) {
                        borderColor = Colors.white;
                        fillColor = Colors.white12;
                      } else {
                        borderColor = Colors.white24;
                        fillColor = Colors.white10;
                      }

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: fillColor,
                          border: Border.all(color: borderColor, width: 1.5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          filled ? code[index] : "",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: hasError ? Colors.red : Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                /// Hidden input
                SizedBox(
                  height: 0,
                  width: 0,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    autofocus: true,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                /// Next button
                GradientButton(
                  text: "Next",
                  onTap: (){

                  },
                ),

                const SizedBox(height: 16),

                GradientButton(
                  text: "I didn’t get the code",
                  onTap: () {},
                ),

                const Spacer(),

                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: "I already have an ",
                      style: TextStyle(color: Colors.white54),
                      children: [
                        TextSpan(
                          text: "account",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







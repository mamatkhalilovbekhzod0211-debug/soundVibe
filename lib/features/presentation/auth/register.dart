import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saundvibe/features/presentation/auth/widgets/widgets.dart';

class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<Register> createState() {
    return _RegisterSignInState();
  }

}

class _RegisterSignInState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              const SizedBox(height: 24),

              // Title
              const Text(
                "What's your mobile number?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              const Text(
                "Enter the mobile number where you can contacted.\n"
                    "No one will see this on your profile\n\n"
                    "You may receive WhatsApp and SMS notifications\n"
                    "from us for security and login purposes",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // Phone input
              TextField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Mobile number",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF1C1C1C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
              Spacer(flex: 2),
              const SizedBox(height: 24),

              // Next button
              GradientButton(
                text: "Next",
                onTap: () {},
              ),

              const SizedBox(height: 16),

              // Sign up with email button
              GradientButton(
                text: "Sign up with email",
                onTap: () {},
              ),

              const Spacer(flex: 1,),

              // Bottom text
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "I already have an account",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}


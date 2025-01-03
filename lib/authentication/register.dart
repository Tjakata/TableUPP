import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/tableupp_logo.png'),
            const SizedBox(height: 32),

              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Create open tables or\njoin existing ones',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  ),
                ]
              ),
                   const SizedBox(height: 16),
            Image.asset('assets/images/food_image.jpg'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle log in
              },
              child: const Text('Log in'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle sign up
              },
              child: const Text('Sign up'),
            ),
            ],
        ),
      
      ),
    );
  }
}
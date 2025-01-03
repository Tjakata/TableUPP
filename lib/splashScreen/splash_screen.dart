import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // animated text

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();  // Start the animation

    // Navigate to the next screen after 3 seconds splash
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/authentication/register');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeTransition(
        opacity: _fadeAnimation,  // Fade in the entire splash screen
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'TableUPP',
                    textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 4,  // Run the animation once
              ),
              const SizedBox(height: 16),
              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Where food turns into friends',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    duration: const Duration(seconds: 6),
                  ),
                ],
                totalRepeatCount: 1,  // Run the animation once
              ),
              // const SizedBox(height: 50),
              // CircularProgressIndicator(  // Loading spinner for better UX
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

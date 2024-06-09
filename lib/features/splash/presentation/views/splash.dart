import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gemini_chat/features/home/presentation/views/home.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/animate.json'),
              const SizedBox(
                height: 150,
              ),
              Text(
                'By Devesh Tiwari',
                style: TextStyle(
                  color: Colors.green.withOpacity(0.8),
                  fontSize: 20,
                  // fontFamily: 'Pacifico',
                ),
              ).animate().flipV(duration: 1000.milliseconds),
            ],
            ),
      ),
    );
  }
}

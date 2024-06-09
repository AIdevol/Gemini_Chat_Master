import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

AppBar appBar({required Widget widget,required bool isDark}) => AppBar(
      elevation: 0,
      backgroundColor:isDark ? Colors.black : Colors.white,
      leading: Lottie.asset(
        'assets/images/animate.json',
        width: 70,
      ),
      centerTitle: true,
      title: const Text(
        'Gemini Chat',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      )
          .animate(
            onPlay: (controller) => controller.repeat(reverse: true),
          )
          .fadeIn(
            duration: 2000.milliseconds,
            curve: Curves.easeInOutCubic,
            delay: const Duration(
              milliseconds: 100,
            ),
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: widget,
        ),
      ],
    );

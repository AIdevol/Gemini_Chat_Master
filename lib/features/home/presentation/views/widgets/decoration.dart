import 'package:flutter/material.dart';

BoxDecoration decoration({required bool isDark}) => BoxDecoration(
      color: isDark ? const Color.fromARGB(255, 80, 80, 80) : Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.grey : Colors.black.withOpacity(0.2),
          offset: const Offset(2, 2),
          blurRadius: 2,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: const Offset(-2, -2),
          blurRadius: 2,
        ),
      ],
    );

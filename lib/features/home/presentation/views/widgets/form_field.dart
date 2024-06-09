import 'package:flutter/material.dart';

class FormFieldMessage extends StatelessWidget {
  const FormFieldMessage({
    super.key,
    required this.controller,
    required this.isDark,
  });

  final TextEditingController controller;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        cursorColor: Colors.green,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Send',
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

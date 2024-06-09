// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SendIcon extends StatelessWidget {
  const SendIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/send.png'),
      color: Colors.green,
      width: 30,
      height: 30,
    );
  }
}
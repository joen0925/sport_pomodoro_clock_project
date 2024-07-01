import 'package:flutter/material.dart';

class Clock extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 20.0,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
      backgroundColor: Colors.green,
      value: progress,
    );
  }
}
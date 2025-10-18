import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;

  const TitleWidget({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.blue[800],
      ),
    );
  }
}
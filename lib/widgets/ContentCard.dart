import 'package:flutter/material.dart';
import 'Title.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final Color color;
  final Widget child;

  const ContentCard({
    super.key,
    required this.title,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          TitleWidget(text: title),
          SizedBox(height: 16.0),
          SizedBox(height: 20.0),
          child,
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class QuickNavigation extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final Function(int) onPageSelected;

  const QuickNavigation({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            'Быстрый переход:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              totalPages,
                  (index) => ElevatedButton(
                onPressed: () => onPageSelected(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentIndex == index
                      ? Colors.blue
                      : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: Text('${index + 1}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
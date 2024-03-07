import 'dart:math';

import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    required this.title,
    super.key
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(8)+2;
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[randomNumber*100],
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

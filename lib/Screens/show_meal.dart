import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meal_app/Models/meal_model.dart';

class ShowMeal extends StatelessWidget {
  const ShowMeal({
    required this.meal,
    Key? key,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),

    );
  }
}

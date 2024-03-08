import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal_model.dart';
import 'package:meal_app/Screens/show_meal.dart';

class MealView extends StatelessWidget {
  const MealView({
    required this.meal,
    Key? key,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowMeal(meal: meal)),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildItemImage(),
            _buildItemDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: Image(
        image: AssetImage(meal.imageUrl),
        fit: BoxFit.cover,
        height: 220,
      ),
    );
  }

  Widget _buildItemDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            meal.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${meal.timeToCook} min',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

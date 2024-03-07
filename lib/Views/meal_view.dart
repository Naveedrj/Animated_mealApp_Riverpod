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
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShowMeal(meal: meal) ));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildItemImage(),
              _buildItemDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return SizedBox(
      height: 200,
      child: Image.network(
        meal.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildItemDetails() {
    return Container(
      color: Colors.black45,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

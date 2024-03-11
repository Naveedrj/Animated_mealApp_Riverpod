import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal_model.dart';
import 'package:meal_app/Providers/favorite_provider.dart';
import 'package:meal_app/Screens/favorite_screen.dart';

class ShowMeal extends ConsumerStatefulWidget {
  const ShowMeal({
    required this.meal,
    Key? key,
  }) : super(key: key);

  final Meal meal;

  @override
  _ShowMealState createState() => _ShowMealState();
}

class _ShowMealState extends ConsumerState<ShowMeal> {
  bool isFavorite = false;
  String? buttonMsg;


  @override
  Widget build(BuildContext context) {
    buttonMsg = ref.watch(favMealProvider).contains(widget.meal)? 'Dont like it anymore' : 'Add to favorites';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown,
        title: Text(widget.meal.name,
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Hero(  tag: widget.meal.imageUrl , child: Image(image: AssetImage(widget.meal.imageUrl))),
              width: double.infinity,
              height: 230,
            ),
            Text(
              widget.meal.name,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.meal.timeToCook.toString() + ' minutes',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.brown
                  ),
                  onPressed: (){
                    ref.read(favMealProvider.notifier).favToggle(widget.meal);
                  },
                  child: Text(buttonMsg!),
                ),
              ),
            ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.brown[800]
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen() ));
        },
        child: Text('Favorites'),


            )
          ],
        ),
      ),
    );
  }
}

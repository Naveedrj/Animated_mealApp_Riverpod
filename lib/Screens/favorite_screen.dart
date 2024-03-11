import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/favorite_provider.dart';
import 'package:meal_app/Screens/home_screen.dart';
import 'package:meal_app/Views/meal_view.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    final fav_list = ref.watch(favMealProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Your Favorites',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.brown,
        elevation: 3,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...fav_list.map((e) {
                return MealView(meal: e);
              }),

        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
            },
            child: Text('Home'),),
        )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/Screens/favorite_screen.dart';
import 'package:meal_app/View_Models/categories_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagories',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.brown,
        elevation: 3,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen() ));
          }, icon: Icon(
              Icons.favorite,
            color: Colors.white,
          ))
        ],
      ),
      body: CategoryGrid(),
    );
  }
}

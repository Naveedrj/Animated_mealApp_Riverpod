import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/Models/category_model.dart';
import 'package:meal_app/Providers/meal_provider.dart';
import 'package:meal_app/Views/meal_view.dart';

class ItemList extends ConsumerWidget {
   ItemList({
     required this.category,
     Key? key,
   }) : super(key: key);

  final Category category;

   @override
   Widget build(BuildContext context , WidgetRef ref) {

     final mealList = ref.watch(mealProviderList);

     double deviceWidth = MediaQuery.of(context).size.width;
     int count;
     if(deviceWidth > 700  ){
       count = 3;
     }else if(deviceWidth > 500 && deviceWidth < 700){
       count =  2;
     }else{
       count = 1;
     }

     return Scaffold(
       appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.white),
         backgroundColor: Colors.brown,
         title: Text(category.title,
         style: TextStyle(
           fontSize: 28,
           fontWeight: FontWeight.bold,
           color: Colors.white,
         ),
         ),
       ),
       body: Center(
         child: GridView(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: count,
             childAspectRatio: 3 / 2,
             crossAxisSpacing: 20,
             mainAxisSpacing: 20,
           ),
           children: mealList
               .where((meal) => meal.categoryId == category.id)
               .map((item) => MealView(meal: item))
               .toList(),
         ),
       ),
     );
   }

}

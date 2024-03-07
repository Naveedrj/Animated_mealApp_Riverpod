import 'package:flutter/material.dart';
import '../Models/category_model.dart';
import '../Views/category_view.dart';
import 'package:meal_app/View_Models/meal_view_model.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({Key? key}) : super(key: key);

  List<Category> categoriesList = [
    Category(title: 'Fast Food', id: 1),
    Category(title: 'Italian', id: 2),
    Category(title: 'Indian', id: 3),
    Category(title: 'BBQ', id: 4),
    Category(title: 'Fried', id: 5),
    Category(title: 'Sea Food', id: 6),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth > 600) ? 3 : 2;

    return Padding(
      padding: EdgeInsets.all(12),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: List.generate(
          categoriesList.length,
              (index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(category: categoriesList[index]),
                ),
              );
            },
            child: CategoryView(title: categoriesList[index].title),
          ),
        ),
      ),
    );
  }
}

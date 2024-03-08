import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/category_provider.dart';


import '../Views/category_view.dart';
import 'package:meal_app/View_Models/meal_view_model.dart';

class CategoryGrid extends ConsumerWidget {
  CategoryGrid({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context ,  WidgetRef ref) {

    final list = ref.watch(category_list);

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
          list.length,
              (index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemList(category: list[index]),
                ),
              );
            },
            child: CategoryView(title: list[index].title),
          ),
        ),
      ),
    );
  }
}

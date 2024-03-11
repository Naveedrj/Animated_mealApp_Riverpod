import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/category_provider.dart';

import '../Views/category_view.dart';
import 'package:meal_app/View_Models/meal_view_model.dart';

class CategoryGrid extends ConsumerStatefulWidget {
  CategoryGrid({Key? key}) : super(key: key);

  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends ConsumerState<CategoryGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.read(category_list);

    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth > 600) ? 3 : 2;

    return Padding(
      padding: EdgeInsets.all(12),
      child: SlideTransition(
        position: _offsetAnimation,
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
      ),
    );
  }
}

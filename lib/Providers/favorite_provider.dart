import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Models/meal_model.dart';

class FavNotifier extends StateNotifier<List<Meal>>{
  FavNotifier() : super([]);

  void favToggle(Meal meal){
    final mealIsfav = state.contains(meal);

    if(mealIsfav){
      state = state.where((element) => element.name != meal.name).toList();
    }else{
      state = [...state , meal];
    }
  }

}

final favMealProvider = StateNotifierProvider<FavNotifier , List<Meal>>((ref) {
  return FavNotifier();
});
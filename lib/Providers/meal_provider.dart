import 'package:meal_app/Data/meal_data.dart';

import 'package:riverpod/riverpod.dart';

final mealProviderList = Provider((ref) {
  return mealList;
});
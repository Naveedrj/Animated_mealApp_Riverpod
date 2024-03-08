import 'package:riverpod/riverpod.dart';

import 'package:meal_app/Data/category_data.dart';

final category_list = Provider((ref) {
  return categoriesList;
});
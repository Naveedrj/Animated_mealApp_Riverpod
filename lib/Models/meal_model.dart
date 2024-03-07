
class Meal{

  Meal({
    required this.name,
    required this.imageUrl,
    required this.timeToCook,
    this.categoryId,
  });

  final String name;
  final String imageUrl;
  final int timeToCook;
  final int? categoryId;


}
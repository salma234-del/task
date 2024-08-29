import 'package:task/models.dart/meal.dart';

class MealResponse {
  final List<Meal> breakfast;
  final List<Meal> lunch;
  final List<Meal> dinner;

  MealResponse({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    return MealResponse(
      breakfast: (json['breakfast'] as List<dynamic>)
          .map((item) => Meal.fromJson(item as Map<String, dynamic>))
          .toList(),
      lunch: (json['lunch'] as List<dynamic>)
          .map((item) => Meal.fromJson(item as Map<String, dynamic>))
          .toList(),
      dinner: (json['dinner'] as List<dynamic>)
          .map((item) => Meal.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'breakfast': breakfast.map((meal) => meal.toJson()).toList(),
      'lunch': lunch.map((meal) => meal.toJson()).toList(),
      'dinner': dinner.map((meal) => meal.toJson()).toList(),
    };
  }
}

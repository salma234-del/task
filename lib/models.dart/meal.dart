class Meal {
  final String image;
  final String name;
  final String description;

  Meal({
    required this.image,
    required this.name,
    required this.description,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'description': description,
    };
  }
}

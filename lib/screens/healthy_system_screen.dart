import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/models.dart/meal.dart';
import 'package:task/models.dart/meal_response.dart';

class HealthySystemScreen extends StatelessWidget {
  const HealthySystemScreen({
    required this.meals,
    super.key,
  });

  final MealResponse meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: RichText(
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Healthy ',
                style: TextStyle(
                  color: Color(0xff181DA8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'system',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildGreetingSection(),
            _buildMealSection(
              context,
              title: 'Breakfast',
              meals: meals.breakfast,
            ),
            _buildMealSection(
              context,
              title: 'Lunch',
              meals: meals.lunch,
            ),
            _buildMealSection(
              context,
              title: 'Dinner',
              meals: meals.dinner,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello Kareem',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'nice to help you',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff181DA8),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildMealSection(BuildContext context,
      {required String title, required List<Meal> meals}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // const Icon(Icons.breakfast_dining, color: Colors.blue),
            // const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff75CAF5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(height: 16),
        Column(
          children: meals.asMap().entries.map((entry) {
            int index = entry.key;
            Meal meal = entry.value;
            return _buildMealCard(
              context,
              imagePath: meal.image,
              mealName: meal.name,
              mealDescription: meal.description,
              isFavorite: false,
              mealNumber: 'Meal ${index + 1}',
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMealCard(
    BuildContext context, {
    required String imagePath,
    required String mealName,
    required String mealDescription,
    required bool isFavorite,
    required String mealNumber,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  placeholder: (context, url) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mealName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff181DA8),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        mealNumber,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mealDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //const SizedBox(width: 16),
            // IconButton(
            //   icon: Icon(
            //     isFavorite ? Icons.favorite : Icons.favorite_border,
            //     color: isFavorite ? Colors.red : Colors.grey,
            //   ),
            //   onPressed: () {
            //     // Add favorite toggle functionality here
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

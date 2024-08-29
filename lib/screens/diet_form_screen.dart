import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/models.dart/meal_response.dart';
import 'package:task/screens/healthy_system_screen.dart';
import 'package:task/services/dio_helper.dart';
import 'package:task/widgets/custom_button.dart';
import 'package:task/widgets/custom_text_field.dart';

class DietForm extends StatefulWidget {
  const DietForm({super.key});

  @override
  State<DietForm> createState() => _DietFormState();
}

class _DietFormState extends State<DietForm> {
  final String _apiKey = 'key=AIzaSyCGC3nocPGvIBMERbia6an2PaKUJ7eZZN0';
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bloodController = TextEditingController();
  final TextEditingController chronicDiseasesController =
      TextEditingController();

  Future<MealResponse?> _sendMessage() async {
    try {
      final response = await DioHelper.post(
        url: '/v1beta/models/gemini-1.5-flash-latest:generateContent?$_apiKey',
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text": '''
                Generate a diet plan based on the following information:
                Name: ${nameController.text}
                Age: ${ageController.text}
                Height: ${heightController.text}
                Weight: ${weightController.text}
                Blood Type: ${bloodController.text}
                Chronic Diseases: ${chronicDiseasesController.text}
                
                Please provide meals for breakfast, lunch, and dinner. Each meal should include:
                - Image (URL)
                - Name
                - Description
                
                Format the response as a JSON with the following structure:
                {
                  "breakfast": [
                  {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },
                  {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },

                  ],
                  "lunch": [
                  {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },
                  {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },
                  ],
                  "dinner": [
                  {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },
                   {
                    "image": "URL or description",
                    "name": "Meal Name",
                    "description": "Meal Description"
                  },
                  ]
                }
                please send the json only without any additional text,and make sure to provide the correct data and with a valid image URL please, give egyptian food wuth valud URLs in Egypt, please please please don't add extra text just send the json like that {}
                '''
                }
              ]
            }
          ]
        },
      );
      print(
          response.data['candidates'].first['content']['parts'].first['text']);
      if (response.statusCode == 200) {
        String message =
            response.data['candidates'].first['content']['parts'].first['text'];

        var jsonResponse = jsonDecode(message);

        MealResponse mealResponse = MealResponse.fromJson(jsonResponse);
        return mealResponse;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred not 200'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred ${e.toString()}'),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Generate ',
                            style: TextStyle(
                              color: Color(0xff181DA8),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'diet',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      height: 5,
                    ),
                    const Center(
                      child: Text(
                        'Please fill the input below here',
                        style: TextStyle(
                          color: Color(0xffCCC5C5),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff75CAF5),
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Enter your name',
                      labelText: '',
                    ),
                    Container(
                      height: 10,
                    ),
                    const Text(
                      'Age',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff75CAF5),
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      hintText: 'Enter your age',
                      labelText: '',
                    ),
                    Container(
                      height: 10,
                    ),
                    const Text(
                      'height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff75CAF5),
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      hintText: 'Enter your height',
                      labelText: '',
                    ),
                    Container(
                      height: 10,
                    ),
                    const Text(
                      'weight',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff75CAF5),
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      hintText: 'Enter your weight',
                      labelText: '',
                    ),
                    Container(
                      height: 10,
                    ),
                    const Text(
                      'Blood',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff75CAF5),
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: bloodController,
                      keyboardType: TextInputType.text,
                      hintText: 'Enter your blood',
                      labelText: '',
                    ),
                    Container(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        'chronic diseases',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff75CAF5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    CustomTextForm(
                      controller: chronicDiseasesController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      hintText: 'Type chronic diseases here',
                      labelText: '',
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      title: 'Send',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            try {
                              final MealResponse? meals = await _sendMessage();
                              if (meals == null) {
                                setState(() {
                                  _isLoading = false;
                                });
                                return;
                              }

                              print('Breakfast: ${meals.breakfast}');
                              print('Lunch: ${meals.lunch}');
                              print('Dinner: ${meals.dinner}');

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HealthySystemScreen(
                                    meals: meals,
                                  ),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error occurred...'),
                                ),
                              );
                            } finally {
                              setState(() {
                                _isLoading = false; // Set loading to false
                              });
                            }
                          }
                        }
                      },
                    ),
              Container(
                height: 20,
              ),
              Center(
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Powered by ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Chat GPT',
                        style: TextStyle(
                          color: Color(0xff181DA8),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

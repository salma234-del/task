import 'package:flutter/material.dart';
import 'package:task/screens/diet_form_screen.dart';
import 'package:task/services/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DietForm(),
    );
  }
}

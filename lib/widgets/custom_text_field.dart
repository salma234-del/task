import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final int maxLines;
  final TextEditingController controller;
//  final Icon  prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          hintText: hintText,
          labelText: labelText,

          // prefix:prefix ,

          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.controller,
    this.hintText,
  });

  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black, // Input text color
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5), // Hint text color
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.blue, // Outline border color
              width: 2, // Outline border thickness
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Color(
                0xff4168EB,
              ), // Border color when field is not focused
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color(0xff4168EB), // Border color when field is focused
              width: 0.5,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 30,
          ),
        ),
      ),
    );
  }
}

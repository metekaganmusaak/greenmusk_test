import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: lightGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: lightGrey,
          ),
        ),
        hintText: hintText,
      ),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}

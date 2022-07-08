import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomChips extends StatelessWidget {
  const CustomChips({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      elevation: 4,
      label: Text(
        title,
        style: const TextStyle(color: chipColor),
      ),
      onPressed: onPressed,
      avatar: const Icon(
        Icons.add_circle,
        color: chipColor,
      ),
      backgroundColor: white,
    );
  }
}

class CustomDeletableChip extends StatelessWidget {
  const CustomDeletableChip({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 4,
      label: Text(
        title,
        style: const TextStyle(color: white),
      ),

      deleteIcon: const Icon(Icons.dangerous_rounded, color: white,),
      onDeleted: (){},
      backgroundColor: indigoBlue,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greenmusk_test/core/constants/app_colors.dart';
import 'package:greenmusk_test/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.hasBackgroundColor,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final bool hasBackgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: hasBackgroundColor ? indigoBlue : transparent,
        elevation: hasBackgroundColor ? 7 : 0,
        fixedSize: const Size(150, 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: buttonTextStyle.copyWith(
          color: hasBackgroundColor ? white : indigoBlue,
        ),
      ),
    );
  }
}

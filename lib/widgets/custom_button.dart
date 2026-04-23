// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final BorderRadius _borderRadius = const BorderRadius.all(
    Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _borderRadius,
      child: Ink(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            begin: .topCenter,
            end: .bottomCenter,
            colors: [
              AppColors.blue,
              const Color(0xFF0142CF),
            ]
          )
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: AppTextStyles.defaultButtons,
            ),
          ),
        ),
      ),
    );
  }
}

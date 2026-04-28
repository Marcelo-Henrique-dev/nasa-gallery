import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {

  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.bluePrimary,
      width: 2.0,
    ),
    borderRadius: .all(Radius.circular(28)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        labelText: 'Search',
        labelStyle: AppTextStyles.inputText.copyWith(color: AppColors.defaultText),
        hintStyle: AppTextStyles.inputHintText.copyWith(color: AppColors.defaultText),
        focusedBorder: defaultBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.blueSecondary
          )
        ),
        enabledBorder: defaultBorder,
        errorBorder: defaultBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.redPrimary
          ),
        ),
        focusedErrorBorder: defaultBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.redSecondary
          ),
        ),
        
      ),
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final ValueChanged<String>? onFieldSubmited;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    this.onFieldSubmited,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bluePrimary,
        width: 2.0
      ),
      borderRadius: .circular(28)
    );
    return TextFormField(
      textInputAction: .search,
      controller: controller,
      onFieldSubmitted: onFieldSubmited,
      decoration: InputDecoration(
        labelText: 'Search',
        focusedBorder: defaultBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.blueSecondary,
          )
        ),
        enabledBorder: defaultBorder,
      ),
    );
  }
}

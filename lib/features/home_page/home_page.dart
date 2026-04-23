import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: AppColors.black,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.blue,
            width: 4
          )
        ),
        centerTitle: true,
        title: Text(
          "NASA",
          style: AppTextStyles.titleAppBar,
        ),
      ),
      body: Column(
        spacing: 30,
        children: [
          Image.asset(
            'assets/images/home_bg.jpg'
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper, justo sed cursus vulputate, nibh tellus fringilla odio, at blandit nulla nisi nec enim. Proin vitae leo tortor. Quisque nec volutpat dolor, at eleifend leo. Curabitur tristique nisl eros, vel vulputate dolor posuere id.',
              style: AppTextStyles.mediumText,
              textAlign: .justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40
            ),
            child: CustomButton(
              text: "Gallery",
              onPressed: () => log('teste'),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';

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
    );
  }
}
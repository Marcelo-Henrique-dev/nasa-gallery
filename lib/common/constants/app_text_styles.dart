import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';

class AppTextStyles {

  static TextStyle titleAppBar = TextStyle(
    fontSize: 40,
    fontFamily: 'Nasalization',
    fontWeight: .bold,
    color: AppColors.red
  );

  static TextStyle mediumText = TextStyle(
    fontSize: 20,
    fontFamily: 'Nasalization',
    fontWeight: .normal,
    color: AppColors.defaultText,
  );

  static TextStyle defaultButtons = TextStyle(
    fontSize: 20,
    fontFamily: 'Nasalization',
    fontWeight: .bold,
    color: AppColors.white,
  );

}
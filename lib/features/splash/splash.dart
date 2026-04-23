import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .topCenter,
            end: .bottomCenter,
            colors: AppColors.blueGradient
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  AppColors.black.withAlpha(40),
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  'assets/images/nasa_logo.png',
                  width: 320,
                  height: 320,
                ),
              ),
            ),
            Image.asset(
              'assets/images/nasa_logo.png',
              width: 300,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: .center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .topCenter,
            end: .bottomCenter,
            colors: AppColors.blueGradient
          )
        ),
        child: Image.asset(
          'assets/images/nasa_logo.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
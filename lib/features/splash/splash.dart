import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_app/features/home_page/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  Timer(const Duration(seconds: 5), (){
    if(mounted){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=> const HomePage())
      );
    }
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/images/bg_nasa.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nasa_app/features/gallery_page/gallery_page.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
import 'package:nasa_app/features/splash/splash.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryPage(),
    ),
  );
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
import 'package:nasa_app/widgets/custom_form_field.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          icon: Icon(Icons.home),
          color: AppColors.white,
          style: IconButton.styleFrom(
            shape: CircleBorder(),
            padding: .all(16),
            backgroundColor: AppColors.bluePrimary,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.grey,
          elevation: 4,
          shadowColor: AppColors.black,
          shape: Border(
            bottom: BorderSide(color: AppColors.bluePrimary, width: 4),
          ),
          title: Text(
            'Gallery',
            style: AppTextStyles.titleAppBar.copyWith(
              color: AppColors.bluePrimary,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(child: CustomFormField()),
                  IconButton(
                    onPressed: () => log("Filter"),
                    icon: Icon(Icons.filter_alt),
                    color: AppColors.white,
                    style: IconButton.styleFrom(
                      shape: CircleBorder(),
                      padding: .all(12),
                      backgroundColor: AppColors.bluePrimary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 30,
                top: 20,
              ),
              child: Column(
                spacing: 20,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/home_bg.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

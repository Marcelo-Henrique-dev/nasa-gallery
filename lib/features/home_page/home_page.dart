import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/features/gallery_page/gallery_page.dart';
import 'package:nasa_app/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        elevation: 4,
        shadowColor: AppColors.black,
        shape: Border(
          bottom: BorderSide(color: AppColors.redPrimary, width: 4),
        ),
        centerTitle: true,
        title: Text(
          "NASA",
          style: AppTextStyles.titleAppBar.copyWith(
            color: AppColors.redPrimary,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset('assets/images/home_bg.jpg'),
            ),
          ),
          Text(
            'Welcome',
            style: AppTextStyles.largeText.copyWith(
              color: AppColors.bluePrimary,
            ),
            textAlign: .center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              'Explore o Universo Através das Imagens da NASA \n Descubra diariamente as imagens mais impressionantes do espaço capturadas pela NASA. Explore galáxias distantes, nebulosas coloridas, planetas fascinantes e registros incríveis do universo diretamente no seu celular.',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.defaultText,
              ),
              textAlign: .center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: CustomButton(
              text: "Gallery",
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

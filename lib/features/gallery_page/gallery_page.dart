import 'package:flutter/material.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
import 'package:nasa_app/widgets/custom_button.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        text: "Voltar Home",
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}

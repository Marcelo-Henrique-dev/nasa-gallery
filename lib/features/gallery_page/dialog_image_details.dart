import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';

class DialogImageDetails extends StatelessWidget {
  final String igmUrl;
  final String title;
  final String description;
  final String? photographer;
  final String? date;

  const DialogImageDetails({super.key, required this.igmUrl, required this.title, required this.description, this.date, this.photographer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: .circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: .vertical(top: .circular(20)),
                    child: Image.network(
                      igmUrl,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Icon(Icons.broken_image),
                    ),
                  ),
                  Padding(
                    padding: .all(12),
                    child: Text(
                      title,
                      style: AppTextStyles.mediumText.copyWith(color: AppColors.blueSecondary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child: Text(
                      description,
                      style: AppTextStyles.mediumText.copyWith(fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

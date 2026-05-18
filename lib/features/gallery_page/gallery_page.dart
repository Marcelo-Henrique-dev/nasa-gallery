import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/common/constants/app_text_styles.dart';
import 'package:nasa_app/features/gallery_page/dialog_image_details.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
import 'package:nasa_app/service/nasa_service.dart';
import 'package:nasa_app/widgets/custom_form_field.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<dynamic>> _nasaPhotos;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nasaPhotos = NasaService().searchImages('Earth');
  }

  void _executeSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _nasaPhotos = NasaService().searchImages(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(Icons.home),
          color: AppColors.white,
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            backgroundColor: AppColors.bluePrimary,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.grey,
          elevation: 4,
          shadowColor: AppColors.black,
          shape: const Border(
            bottom: BorderSide(color: AppColors.redPrimary, width: 4),
          ),
          title: Text(
            'Gallery',
            style: AppTextStyles.titleAppBar.copyWith(
              color: AppColors.redPrimary,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: _searchController,
                      onFieldSubmited: _executeSearch,
                      sufixIcon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _nasaPhotos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Erro ao carregar galeria',
                        style: AppTextStyles.mediumText,
                      ),
                    );
                  }

                  final items = snapshot.data ?? [];

                  if (items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 80,
                            color: AppColors.redPrimary,
                          ),
                          Text(
                            'Nothing found for:\n "${_searchController.text}"',
                            style: AppTextStyles.mediumText.copyWith(
                              color: AppColors.redSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final Map<String, dynamic> dataMap = item['data'][0];

                      final String imageUrl = item['links'][0]['href'];
                      final String title = dataMap['title'];
                      final String date = dataMap['date_created'];
                      final String? photographer = dataMap['photographer'];
                      final String descriptionKey = dataMap.keys.firstWhere(
                        (key) => key.startsWith('description'),
                        orElse: () => 'description',
                      );
                      final String description = dataMap[descriptionKey] ?? 'No description available';
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.grey,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => DialogImageDetails(
                                    imgUrl: imageUrl,
                                    title: title,
                                    description: description,
                                    photographer: photographer ?? 'NASA',
                                    date: date,
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                child: Image.network(
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      height: 250,
                                      child: Center(
                                        child: SizedBox(
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: AppColors.redPrimary,
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                    loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  imageUrl,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                title,
                                style: AppTextStyles.titleAppBar.copyWith(
                                  fontSize: 14,
                                  color: AppColors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
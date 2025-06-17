import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/custom_card.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/my_subject_app_bar.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class Audio extends StatelessWidget {
  final String subjectName;

  const Audio({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> files = [
      {
        'title': 'المحاضرة الأولى',
        'type': 'MP3',
        'image': 'assets/images/subjects/MP3.png',
      },
      {
        'title': 'المحاضرة الثانية',
        'type': 'MP3',
        'image': 'assets/images/subjects/MP3.png',
      },
      {
        'title': 'المحاضرة الثالثة',
        'type': 'MP3',
        'image': 'assets/images/subjects/MP3.png',
      },
      {
        'title': 'المحاضرة الرابعة',
        'type': 'MP3',
        'image': 'assets/images/subjects/MP3.png',
      },
    ];

    return Scaffold(
      appBar: MySubjectAppBar(title: 'موادي'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.p20,
              right: AppSizes.p16,
              bottom: AppSizes.p8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
                RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: AppSizes.s20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                    children: [
                      TextSpan(
                        text: subjectName,
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                      ),
                      const TextSpan(text: ' > '),
                      const TextSpan(text: 'الصوتيات'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.lightBlue),

          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final item = files[index];
                return CustomCard(
                  title: item['title'],
                  icon: Icon(Icons.download, color: AppColors.secondary),
                  image: Image.asset(item['image'], fit: BoxFit.cover),
                  details: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: AppColors.grey,
                      size: AppSizes.s14,
                    ),
                    onPressed: () {},
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

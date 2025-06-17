import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/dialogs/file_details_dialog.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/dialogs/filter_year_dialog.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/custom_card.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/my_subject_app_bar.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class Lectures extends StatelessWidget {
  final String subjectName;

  const Lectures({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> files = [
      {
        'title': 'المحاضرة الأولى',
        'type': 'pdf',
        'image': 'assets/images/subjects/pdf.png',
      },
      {
        'title': 'المحاضرة الثانية',
        'type': 'pdf',
        'image': 'assets/images/subjects/pdf.png',
      },
      {
        'title': 'المحاضرة الثالثة',
        'type': 'pdf',
        'image': 'assets/images/subjects/pdf.png',
      },
      {
        'title': 'المحاضرة الرابعة',
        'type': 'pdf',
        'image': 'assets/images/subjects/pdf.png',
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
                      const TextSpan(text: 'المحاضرات'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.lightBlue),
          Padding(
            padding: const EdgeInsets.only(
              right: AppSizes.p20,
              top: AppSizes.p8,
              bottom: AppSizes.p8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: AppColors.greyBlue),
                  ),
                  child: IconButton(
                    onPressed: () => FilterYearDialog.show(context),
                    icon: Image.asset("assets/images/subjects/filter.png"),
                  ),
                ),
                SizedBox(width: AppSizes.p12),
                Text(
                  "اختيار السنة",
                  style: TextStyle(color: AppColors.secondary),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final item = files[index];
                return CustomCard(
                  title: item['title'],
                  icon: Icon(Icons.download, color: AppColors.secondary),
                  image: Image.asset(
                    item['image'],
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  details: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: AppColors.grey,
                      size: AppSizes.s14,
                    ),
                    onPressed:
                        () => FileDetailsDialog.show(
                          context: context,
                          type: 'PDF',
                          size: '351 كيلوبايت',
                        ),
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

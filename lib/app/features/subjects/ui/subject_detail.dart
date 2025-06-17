import 'package:flutter/material.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/my_subject_app_bar.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/custom_card.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/target_screen.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class SubjectDetail extends StatelessWidget {
  final String subjectName;
  const SubjectDetail({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> lectures = [
      {'title': 'محاضرات', 'icon': "assets/images/subjects/Lectures.png"},
      {'title': 'السلايدات', 'icon': "assets/images/subjects/slides.png"},
      {'title': 'الصوتيات', 'icon': "assets/images/subjects/Audio.png"},
      {'title': 'الملخصات', 'icon': "assets/images/subjects/Summaries.png"},
      {
        'title': 'دورات وسلالم تصحيح',
        'icon': "assets/images/subjects/Exam.png",
      },
      {
        'title': 'إرشاد أكاديمي',
        'icon': "assets/images/subjects/Questions.png",
      },
      {'title': 'إعلانات', 'icon': "assets/images/subjects/advertisements.png"},
    ];

    return Scaffold(
      appBar: MySubjectAppBar(title: 'موادي'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.p20,
              right: AppSizes.p16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.grey),
                ),
                Text(
                  subjectName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.s20,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.lightBlue),
          Expanded(
            child: ListView.builder(
              itemCount: lectures.length,
              itemBuilder: (context, index) {
                final item = lectures[index];
                return CustomCard(
                  title: item['title'],
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.greyBlue),
                  image: Image.asset(item['icon'], fit: BoxFit.cover),
                  // Todo routing
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                getTargetScreen(item['title'], subjectName),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

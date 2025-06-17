import 'package:flutter/material.dart';
import 'package:sa7b/app/features/subjects/ui/managment_subjects.dart';
import 'package:sa7b/app/features/subjects/ui/subject_detail.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/my_subject_app_bar.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/custom_card.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class MySubjectScreen extends StatelessWidget {
  const MySubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> subjects = [
      'التحليل',
      'الهندسة 1',
      'خوارزميات البحث 1',
      'الهندسة 2',
      'الهندسة 1',
      'الهندسة 1',
    ];

    return Scaffold(
      appBar: const MySubjectAppBar(title: 'موادي'),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.m10,
                  right: AppSizes.m10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.r30),
                    border: Border.all(color: AppColors.greyBlue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.p2),
                    child: IconButton(
                      icon: Icon(Icons.settings, size: AppSizes.s40),
                      color: AppColors.secondary,
                      onPressed: () {
                        print("Managment");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManagmentSubjects(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ابحث عن اسم المادة",
                    suffixIcon: const Icon(Icons.search, color: AppColors.grey),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.r30),
                      borderSide: BorderSide(color: AppColors.greyBlue),
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSizes.m10),
            ],
          ),

          Divider(color: AppColors.lightBlue),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  title: subjects[index],
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.greyBlue),
                  // Todo routing
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                SubjectDetail(subjectName: subjects[index]),
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

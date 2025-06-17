import 'package:flutter/material.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/dialogs/show_filter_dialog.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/my_subject_app_bar.dart';
import 'package:sa7b/app/features/subjects/ui/widgets/custom_card.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class ManagmentSubjects extends StatelessWidget {
  const ManagmentSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {
        'title': 'البرمجة',
        'type': 'pdf',
        'icon': 'assets/images/subjects/Cancel.png',
      },
      {
        'title': 'الخوارزميات',
        'type': 'pdf',
        'icon': 'assets/images/subjects/Check.png',
      },
      {
        'title': 'هندسة البرمجيات1',
        'type': 'pdf',
        'icon': 'assets/images/subjects/Cancel.png',
      },
      {
        'title': 'التحليل',
        'type': 'pdf',
        'icon': 'assets/images/subjects/Check.png',
      },
    ];

    return Scaffold(
      appBar: const MySubjectAppBar(title: 'إدارة المواد'),
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
                      onPressed: () {
                        showFilterDialog(context);
                      },
                      icon: Image.asset("assets/images/subjects/filter.png"),
                      color: AppColors.secondary,
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
                final item = subjects[index];
                return CustomCard(
                  title: item['title'],
                  icon: Image.asset(item['icon']),
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

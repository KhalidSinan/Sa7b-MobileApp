import 'package:flutter/material.dart';
import 'package:sa7b/app/features/subjects/ui/audio.dart';
import 'package:sa7b/app/features/subjects/ui/lectures.dart';
import 'package:sa7b/app/features/subjects/ui/summaries.dart';

Widget getTargetScreen(String title, String subjectName) {
  switch (title) {
    case 'محاضرات':
      return Lectures(subjectName: subjectName);
    // case 'السلايدات':
    //   return SlidesPage(subjectName: subjectName);
    case 'الصوتيات':
      return Audio(subjectName: subjectName);
    case 'الملخصات':
      return Summaries(subjectName: subjectName);
    // case 'دورات وسلالم تصحيح':
    //   return ExamsPage(subjectName: subjectName);
    // case 'إرشاد أكاديمي':
    //   return GuidancePage(subjectName: subjectName);
    // case 'إعلانات':
    //   return AnnouncementsPage(subjectName: subjectName);
    default:
      return const Scaffold(
        body: Center(child: Text('الصفحة غير متوفرة')),
      );
  }
}

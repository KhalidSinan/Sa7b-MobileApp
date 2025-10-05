import 'package:flutter/material.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/subject_guidens_screen.dart';

enum SectionType { theoretical, practical, benefit }

class AllSectionScreen extends StatelessWidget {
  final String courseName;
  final int courseId;

  const AllSectionScreen({
    super.key,
    required this.courseName,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'موادي',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF007AFF),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
         Container(
  color: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    children: [
      Expanded(
        child: Text(
          'الإرشاد الأكاديمي ‹ $courseName',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      const SizedBox(width: 8),
      const Icon(Icons.arrow_forward_ios, size: 16),
    ],
  ),
),

              const SizedBox(height: 24),

              SectionCard(
                title: 'القسم العملي',
                icon: Icons.science_outlined,
                onTap: () => _goToSection(context, SectionType.practical),
              ),
              SectionCard(
                title: 'القسم النظري',
                icon: Icons.book_outlined,
                onTap: () => _goToSection(context, SectionType.theoretical),
              ),
              SectionCard(
                title: 'الفائدة العلمية',
                icon: Icons.lightbulb_outline,
                onTap: () => _goToSection(context, SectionType.benefit),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _goToSection(BuildContext context, SectionType type) {
    int initialTabIndex;
    switch (type) {
      case SectionType.theoretical:
        initialTabIndex = 0;
        break;
      case SectionType.practical:
        initialTabIndex = 1;
        break;
      case SectionType.benefit:
        initialTabIndex = 2;
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CourseGuidanceScreen(
          courseId: courseId,
          courseName: courseName,
          initialTabIndex: initialTabIndex, // 🔹 تمرير التب المحدد
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.blue),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

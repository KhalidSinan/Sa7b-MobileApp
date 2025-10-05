import 'package:flutter/material.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/menu.dart';

class MyMenuButton extends StatelessWidget {
  final VoidCallback fetchAllPosts;
  final VoidCallback fetchMyPosts;
  final Future<void> Function() pickDateRange;

  const MyMenuButton({
    super.key,
    required this.fetchAllPosts,
    required this.fetchMyPosts,
    required this.pickDateRange,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => MyMenu(
            onItemSelected: (value) {
              if (value == 'posts') fetchMyPosts();
              if (value == 'allposts') fetchAllPosts();
              if (value == 'datefilter') {
                Future.delayed(const Duration(milliseconds: 200), () {
                  pickDateRange();
                });
              }
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
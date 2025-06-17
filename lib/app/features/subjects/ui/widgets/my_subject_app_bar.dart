import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class MySubjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MySubjectAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            const SizedBox(width: 16),
            Text(title, style: TextStyle(color: AppColors.primary)),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Divider(color: AppColors.lightBlue),
      ),
    );
  }
}

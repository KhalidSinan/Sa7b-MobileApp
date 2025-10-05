import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  final void Function(String) onItemSelected;

  const MyMenu({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('منشوراتي'),
          onTap: () => onItemSelected('posts'),
        ),
        ListTile(
          title: const Text('كل المنشورات'),
          onTap: () => onItemSelected('allposts'),
        ),
        ListTile(
          title: const Text('تصفية حسب التاريخ'),
          onTap: () => onItemSelected('datefilter'),
        ),
      ],
    );
  }
}

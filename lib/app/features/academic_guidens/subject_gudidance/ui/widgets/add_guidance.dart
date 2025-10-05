
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/data/sources/add_guidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/logic/cubits/add_guidance_cubit.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/ui/add_guidance_screen.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class FabAddGuidance extends StatelessWidget {
  final bool showMyPosts;
  final VoidCallback fetchAllPosts;
  final VoidCallback fetchMyPosts;

  const FabAddGuidance({
    super.key,
    required this.showMyPosts,
    required this.fetchAllPosts,
    required this.fetchMyPosts,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) =>
                  AcademicGuidanceCubit(AddAcademicGuidanceRemoteDatasourceImpl()),
              child: const AddGuidancePage(),
            ),
          ),
        ).then((_) {
          if (showMyPosts) {
            fetchMyPosts();
          } else {
            fetchAllPosts();
          }
        });
      },
      child: const Icon(Icons.add),
      shape: const CircleBorder(),
    );
  }
}
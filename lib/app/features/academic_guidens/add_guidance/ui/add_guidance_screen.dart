import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/data/model/add_guidance_model.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/logic/cubits/add_guidance_cubit.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/logic/states/add_guidance_state.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/ui/widgets/AddGuidanceWidgets.dart';

class AddGuidancePage extends StatefulWidget {
  const AddGuidancePage({super.key});

  @override
  State<AddGuidancePage> createState() => _AddGuidancePageState();
}

class _AddGuidancePageState extends State<AddGuidancePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedType;
  final List<String> types = ['theoretical', 'practical', 'benefit'];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    linkController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // 🔹 نحول النص لمصفوفة روابط ونضيف https:// تلقائيًا إذا مفقودة
      final List<String> links = linkController.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .map((e) => e.startsWith('http') ? e : 'https://$e')
          .toList();

      final model = AcademicGuidanceModel(
        courseId: 2,
        content: contentController.text,
        type: selectedType ?? "theoretical",
        title: titleController.text,
        links: links,
      );

      context.read<AcademicGuidanceCubit>().addGuidance(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F3F6),
        appBar: AppBar(
          title: const Text(
            'إضافة إرشاد',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocConsumer<AcademicGuidanceCubit, AddAcademicGuidanceState>(
          listener: (context, state) {
            if (state is AcademicGuidanceSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تم الإضافة بنجاح")),
              );
              titleController.clear();
              linkController.clear();
              contentController.clear();
              setState(() => selectedType = null);
            } else if (state is AcademicGuidanceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AddGuidanceWidgets.profileAndTypeDropdown(
                      selectedType: selectedType,
                      types: types,
                      onChanged: (val) {
                        setState(() {
                          selectedType = val;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    AddGuidanceWidgets.labeledTextField(
                      label: 'ادخل العنوان',
                      controller: titleController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'يرجى إدخال العنوان'
                          : null,
                    ),
                    const SizedBox(height: 30),
                    AddGuidanceWidgets.labeledTextField(
                      label: 'ادخل الروابط (افصل بين الروابط بفاصلة ,)',
                      controller: linkController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'يرجى إدخال الروابط'
                          : null,
                    ),
                    const SizedBox(height: 30),
                    AddGuidanceWidgets.descriptionField(
                      controller: contentController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'يرجى إدخال الوصف'
                          : null,
                    ),
                    const SizedBox(height: 45),
                    state is AcademicGuidanceLoading
                        ? const CircularProgressIndicator()
                        : AddGuidanceWidgets.submitButton(
                            onPressed: () => _submit(context),
                            text: "ارشدنا",
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

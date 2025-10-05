import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/authButton.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/customTextFieldAuth.dart';
import 'package:sa7b/app/features/auth/register/logic/cubits/register_cubit.dart';
import 'package:sa7b/app/features/auth/register/logic/states/register_state.dart';
import 'package:sa7b/app/features/auth/register/ui/widgets/custom_dropdown_form_field.dart';

class RegisterStep2 extends StatelessWidget {
  final RegisterCubit cubit;
  final RegisterState state;
  final VoidCallback onBack;
  final years = [
    DropdownItem(id: 1, name: "السنة الأولى"),
    DropdownItem(id: 2, name: "السنة الثانية"),
    DropdownItem(id: 3, name: "السنة الثالثة"),
    DropdownItem(id: 4, name: "السنة الرابعة"),
    DropdownItem(id: 5, name: "السنة الخامسة"),
  ];
  final departments = [
    DropdownItem(id: 1, name: "الهندسة"),
    DropdownItem(id: 2, name: "الطب"),
    DropdownItem(id: 3, name: "العلوم"),
  ];

  RegisterStep2({
    super.key,
    required this.cubit,
    required this.state,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isFormValid =
        state is RegisterFormUpdated ? (state as RegisterFormUpdated).isValid : false;

    return BlocListener<RegisterCubit, RegisterState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          // في حالة ما يكون اللودينغ، نغلق أي دايلوج مفتوح
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }

        if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم التسجيل بنجاح!")),
          );
        }
      },
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: onBack,
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  "إنشاء حساب",
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Image.asset(
                  "assets/images/signup.png",
                  height: size.height * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: size.height * 0.04),
                CustomAuthTextFormField(
                  controller: cubit.firstNameController,
                  hintText: "الاسم الأول",
                ),
                SizedBox(height: size.height * 0.02),
                CustomAuthTextFormField(
                  controller: cubit.lastNameController,
                  hintText: "الاسم الأخير",
                ),
                SizedBox(height: size.height * 0.02),
                CustomDropdownFormField(
                  hint: "اختيار السنة",
                  items: years,
                  selectedId: cubit.selectedYearId,
                  onChanged: (id) => cubit.updateYearById(id),
                ),
                SizedBox(height: size.height * 0.02),
                CustomDropdownFormField(
                  hint: "اختيار الكلية",
                  items: departments,
                  selectedId: cubit.selectedDepartmentId,
                  onChanged: (id) => cubit.updateDepartmentById(id),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.06,
                  child: AuthButton(
                    onPressed: isFormValid ? cubit.submit : null,
                    isLoading: state is RegisterLoading,
                    text: 'إنشاء حساب',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

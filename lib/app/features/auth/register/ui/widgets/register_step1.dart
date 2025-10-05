import 'package:flutter/material.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/authButton.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/customTextFieldAuth.dart';
import 'package:sa7b/app/features/auth/register/logic/cubits/register_cubit.dart';

class RegisterStep1 extends StatelessWidget {
  final RegisterCubit cubit;
  final VoidCallback onsendOtp;

  const RegisterStep1({super.key, required this.cubit, required this.onsendOtp});
void _showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
    
   child:  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "إنشاء حساب",
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/signup.png",
              height: size.height * 0.2,
              fit: BoxFit.contain,
            ),
            SizedBox(height: size.height * 0.04),
            CustomAuthTextFormField(
              controller: cubit.emailController,
              hintText: "البريد الإلكتروني",
            ),
            SizedBox(height: size.height * 0.02),
            CustomAuthTextFormField(
              controller: cubit.passwordController,
              hintText: "كلمة المرور",
              isPassword: true,
            ),
            SizedBox(height: size.height * 0.02),
            CustomAuthTextFormField(
              controller: cubit.confirmPasswordController,
              hintText: "تأكيد كلمة المرور",
              isPassword: true,
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.06,
              child: AuthButton( onPressed: () {
    final password = cubit.passwordController.text;
    final confirm = cubit.confirmPasswordController.text;
    final email = cubit.emailController.text;

    if (email.isEmpty || !email.contains('@')) {
      _showError(context, 'يرجى إدخال بريد إلكتروني صالح.');
    } else if (password.length < 8) {
      _showError(context, 'كلمة المرور يجب أن تكون 8 أحرف على الأقل.');
    } else if (password != confirm) {
      _showError(context, 'كلمتا المرور غير متطابقتين.');
    } else {
      onsendOtp(); // تابع الإرسال إذا التحقق نجح
    }
  }, text: 'إنشاء حساب'),
            ),
          ],
        ),
      ),
      
    ));
  }
}

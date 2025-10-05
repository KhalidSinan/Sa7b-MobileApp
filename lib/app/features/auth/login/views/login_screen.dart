import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/allsection/screen/AllSectionScreen.dart';
import 'package:sa7b/app/features/auth/login/logic/login_state.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/authButton.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/customTextFieldAuth.dart';
import 'package:sa7b/app/features/auth/register/ui/register_screen.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import '../logic/login_cubit.dart';
import '../data/source/auth_remote_datasource.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => LoginCubit(AuthRemoteDataSourceImpl()),
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Logo Row
                Row(
                  children: [
                    Image.asset(
                      'assets/images/midlife-logo.png',
                      width: widthScreen * 0.15,
                      height: widthScreen * 0.15,
                    ),
                    const Spacer(),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.Cairo,
                      ),
                    ),
                    SizedBox(width: widthScreen * 0.22),
                  ],
                ),

                const SizedBox(height: 24),

                // Main logo
                Center(
                  child: Image.asset(
                    'assets/images/sa7b-logo.png',
                    width: widthScreen * 0.6,
                    height: heightScreen * 0.25,
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: widthScreen * 0.8,
                  child: CustomAuthTextFormField(
                    controller: emailController,
                    hintText: 'البريد الالكتروني',
                  ),
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: widthScreen * 0.8,
                  child: CustomAuthTextFormField(
                    controller: passwordController,
                    hintText: 'كلمة المرور',
                    isPassword: true,
                  ),
                ),

                const SizedBox(height: 32),

                // Login button + Sign Up button
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    } else if (state is LoginSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllSectionScreen(
                            courseName: 'تحليل',
                            courseId: 2,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is LoginLoading;

                    return Column(
                      children: [
                        SizedBox(
                          width: widthScreen * 0.75,
                          height: heightScreen * 0.075,
                          child: AuthButton(
                            onPressed: () {
                              context.read<LoginCubit>().login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                            },
                            isLoading: isLoading,
                            text: 'تسجيل دخول',
                          ),
                        ),
                        const SizedBox(height: 20), // مسافة بين الزرين
                        TextButton(
                          onPressed: () {
                            // ضع هنا التنقل لشاشة إنشاء حساب
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'إنشاء حساب جديد',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

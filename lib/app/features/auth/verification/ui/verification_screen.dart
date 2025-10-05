import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sa7b/app/features/auth/login/views/widgets/authButton.dart';
import 'package:sa7b/app/features/auth/verification/logic/cubits/verification_cubit.dart';
import 'package:sa7b/app/features/auth/verification/logic/states/verification_state.dart';

class VerificationScreen extends StatelessWidget {
  final String email;
  final VoidCallback onVerified;

  const VerificationScreen({
    super.key,
    required this.email,
    required this.onVerified,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => VerificationCubit(),
      child: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {
          if (state is VerificationSuccess) {
            Navigator.pop(context); // الرجوع إلى RegisterScreen
            onVerified(); // الذهاب إلى الخطوة الثانية
          } else if (state is VerificationError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<VerificationCubit>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Verification Code"),
              leading: const BackButton(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height - kToolbarHeight - 50,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(
                          "assets/images/verification.png",
                          height: 180,
                        ),
                        const SizedBox(height: 20),
                        const Text("The Code Has Been Sent To"),
                        Text(email, style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 30),
                        Directionality(
                          textDirection: TextDirection.ltr, // أو rtl حسب الحاجة
                          child: PinCodeTextField(
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.number,
                            autoFocus: true,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.circle,
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration: const Duration(
                              milliseconds: 300,
                            ),
                            enableActiveFill: true,
                            onChanged: (value) {
                              cubit.code = value;
                            },
                            appContext: context,
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Didn’t Receive? Click Here"),
                        ),
                        const Spacer(),
                        AuthButton(
                          onPressed: () => cubit.verifyCode(email, cubit.code),
                          isLoading: state is VerificationLoading,
                          text: "تأكيد",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

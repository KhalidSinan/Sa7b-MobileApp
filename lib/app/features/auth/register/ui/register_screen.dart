import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sa7b/app/features/auth/register/data/sources/register_remote_datasource.dart';
import 'package:sa7b/app/features/auth/register/ui/widgets/register_step1.dart';
import 'package:sa7b/app/features/auth/register/ui/widgets/register_step2.dart';
import 'package:sa7b/app/features/auth/verification/ui/verification_screen.dart';
import '../logic/cubits/register_cubit.dart';
import '../logic/states/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider<RegisterRemoteDatasource>(
      create: (_) => RegisterRemoteDataSourceImpl(),
      child: BlocProvider(
        create:
            (context) =>
                RegisterCubit(context.read<RegisterRemoteDatasource>()),
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              final cubit = context.read<RegisterCubit>();

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: BlocListener<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder:
                              (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                        );
                      } else if (state is RegisterOtpSent) {
                        Navigator.pop(context); // يسكر اللودينغ
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => VerificationScreen(
                                  email: state.email,
                                  onVerified: () {
                                    _controller.jumpToPage(1);
                                  },
                                ),
                          ),
                        );
                      } else if (state is RegisterError) {
                        Navigator.pop(context); // يسكر اللودينغ
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    child: PageView(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RegisterStep1(
                          cubit: cubit,
                          onsendOtp: () async {
                            FocusScope.of(context).unfocus();
                            await cubit.sendOtp();
                          },
                        ),
                        RegisterStep2(
                          cubit: cubit,
                          state: state,
                          onBack: () {
                            FocusScope.of(context).unfocus();
                            _controller.jumpToPage(0);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

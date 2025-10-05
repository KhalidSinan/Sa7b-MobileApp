import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/auth/register/data/sources/register_remote_datasource.dart';
import 'package:sa7b/app/features/auth/register/logic/states/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.remoteDataSource) : super(RegisterInitial());

  final RegisterRemoteDatasource remoteDataSource;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  int? selectedYearId;
  int? selectedDepartmentId;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void updateEmail(String value) {
    emailController.text = value;
    _validate();
  }

  void updatePassword(String value) {
    passwordController.text = value;
    _validate();
  }

  void updateConfirmPassword(String value) {
    confirmPasswordController.text = value;
    _validate();
  }

  void updateFirstName(String value) {
    firstNameController.text = value;
    _validate();
  }

  void updateLastName(String value) {
    lastNameController.text = value;
    _validate();
  }

  void updateYearById(int? value) {
    selectedYearId = value;
    _validate();
  }

  void updateDepartmentById(int? value) {
    selectedDepartmentId = value;
    _validate();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterFormUpdated(isValid: _isFormValid()));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegisterFormUpdated(isValid: _isFormValid()));
  }

  void _validate() {
    emit(RegisterFormUpdated(isValid: _isFormValid()));
  }

  bool _isFormValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text == passwordController.text &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        selectedYearId != null &&
        selectedDepartmentId != null;
  }

  Future<void> submit() async {
    emit(RegisterLoading());
    try {
      final user = await remoteDataSource.register(
        firstNameController.text,
        lastNameController.text,
        selectedYearId!,
        selectedDepartmentId!,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  Future<void> sendOtp() async {
  try {
    emit(RegisterLoading());
    await remoteDataSource.sendOtp(emailController.text);
    emit(RegisterOtpSent(emailController.text));
  } catch (error) {
    final message = error is Exception 
      ? error.toString().replaceFirst('Exception: ', '') 
      : 'حدث خطأ غير متوقع';
    emit(RegisterError(message));
  }
}


}

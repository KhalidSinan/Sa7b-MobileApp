import 'package:flutter/foundation.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {
   RegisterInitial();

  @override
  String toString() => 'RegisterInitial';
}

class RegisterLoading extends RegisterState {
   RegisterLoading();

  @override
  String toString() => 'RegisterLoading';
}

class RegisterFormUpdated extends RegisterState {
  final bool isValid;

 RegisterFormUpdated({required this.isValid});

  @override
  String toString() => 'RegisterFormUpdated(isValid: $isValid)';
}

class RegisterOtpSent extends RegisterState {
  final String email;

  
   RegisterOtpSent(this.email);

  @override
  String toString() => 'RegisterOtpSent(email: $email)';
}

class RegisterError extends RegisterState {
  final String message;

   RegisterError(this.message);

  @override
  String toString() => 'RegisterError(message: $message)';
}

class RegisterSuccess extends RegisterState {
  final dynamic user; // غيرها لـ UserModel لو متأكد
   RegisterSuccess(this.user);

  @override
  String toString() => 'RegisterSuccess(user: $user)';
}

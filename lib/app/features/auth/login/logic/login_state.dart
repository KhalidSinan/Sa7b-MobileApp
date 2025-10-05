import 'package:equatable/equatable.dart';
import 'package:sa7b/app/features/auth/login/data/models/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;

  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  final String error;

  const LoginError(this.error);

  @override
  List<Object?> get props => [error];
}

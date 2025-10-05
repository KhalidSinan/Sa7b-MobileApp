import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sa7b/app/features/auth/login/data/source/auth_remote_datasource.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRemoteDataSource remoteDataSource;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  LoginCubit(this.remoteDataSource) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await remoteDataSource.login(email, password);

      // ✅ تخزين التوكن بشكل آمن
      await _secureStorage.write(
        key: 'access_token',
        value: user.accessToken,
      );

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}

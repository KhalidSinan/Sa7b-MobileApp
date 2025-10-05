import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/auth/verification/data/sources/verification_data_Sources.dart';
import 'package:sa7b/app/features/auth/verification/logic/states/verification_state.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationDataSources verificationDataSource;

  VerificationCubit()
    : verificationDataSource = GetIt.I<VerificationDataSources>(),
      super(VerificationInitial());

  String code = '';

  Future<void> verifyCode(String email, String code) async {
    emit(VerificationLoading());
    try {
      await verificationDataSource.verifyCode(email, code);
      emit(VerificationSuccess());
    } catch (error) {
      if (error is NetworkExceptions) {
        emit(VerificationError(NetworkExceptions.getErrorMessage(error)));
      } else if (error is Exception) {
        emit(
          VerificationError(error.toString().replaceFirst('Exception: ', '')),
        );
      } else {
        emit(VerificationError("حدث خطأ غير متوقع"));
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../data/models/certificates/certificate_response.dart';
import '../../../data/repos/profile_repo.dart';

part '../../states/certificates_state.dart';
part 'certificates_cubit.freezed.dart';

class CertificatesCubit extends Cubit<CertificatesState> {
  final ProfileRepo _profileRepo;

  CertificatesCubit(this._profileRepo) : super(CertificatesState.initial());

  Future<void> certificateById() async {
    emit(CertificatesState.loading());
    try {
      final response = await _profileRepo.certificateById();
      emit(CertificatesState.success(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CertificatesState.error(error: message));
    }
  }
}

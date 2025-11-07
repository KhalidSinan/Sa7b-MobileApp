import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/profile/data/models/certificates/certificate_response.dart';
import 'package:sa7b/app/features/profile/data/repos/certificates_list_repo.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';

part '../../states/certificates_list_state.dart';
part 'certificates_list_cubit.freezed.dart';

class CertificatesListCubit extends Cubit<CertificatesListState> {
  final CertificatesListRepo _certificatesListRepo;
  CertificatesListCubit(this._certificatesListRepo)
    : super(CertificatesListState.initial());

  Future<void> certificates() async {
    emit(CertificatesListState.loading());
    try {
      final posts = await _certificatesListRepo.certificates();
      emit(CertificatesListState.success(posts));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CertificatesListState.error(error: message));
    }
  }
}

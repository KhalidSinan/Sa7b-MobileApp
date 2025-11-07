part of '../cubit/certificates/certificates_list_cubit.dart';

@freezed
class CertificatesListState with _$CertificatesListState {
  const factory CertificatesListState.initial() = _Initial;
  const factory CertificatesListState.loading() = Loading;
  const factory CertificatesListState.success(
    CertificateResponse certificateResponse,
  ) = Success;
  const factory CertificatesListState.error({required String error}) = Error;
}

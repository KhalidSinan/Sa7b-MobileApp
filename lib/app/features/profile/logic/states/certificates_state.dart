part of '../cubit/certificates/certificates_cubit.dart';

@freezed
class CertificatesState<T> with _$CertificatesState {
  const factory CertificatesState.initial() = _Initial;
  const factory CertificatesState.loading() = Loading;
  const factory CertificatesState.success(CertificateResponse certificateResponse) =
      Success<T>;
  const factory CertificatesState.error({required String error}) = Error;
}

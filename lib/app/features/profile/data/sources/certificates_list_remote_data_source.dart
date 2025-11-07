import 'package:dio/dio.dart';
import 'package:sa7b/app/features/profile/data/models/certificates/certificate_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';

abstract class CertificatesListRemoteDataSource {
  Future<CertificateResponse> certificates();
}

class CertificatesListRemoteDataSourceImp
    implements CertificatesListRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  CertificatesListRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<CertificateResponse> certificates() async {
    try {
      final certificates = await apiServicesImpl.get(AppUrl.certificates);
      return CertificateResponse.fromJson(certificates);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}

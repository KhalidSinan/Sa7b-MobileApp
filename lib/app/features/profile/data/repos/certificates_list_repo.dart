import 'package:sa7b/core/services/network_info.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../models/certificates/certificate_response.dart';
import '../sources/certificates_list_remote_data_source.dart';

class CertificatesListRepo {
  final CertificatesListRemoteDataSource certificatesListRemoteDataSource;
  final NetworkInfo networkInfo;

  CertificatesListRepo({
    required this.certificatesListRemoteDataSource,
    required this.networkInfo,
  });

  Future<CertificateResponse> certificates() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await certificatesListRemoteDataSource.certificates();
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}

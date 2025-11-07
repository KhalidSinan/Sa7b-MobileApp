import 'package:sa7b/app/features/send_complaint/data/sources/send_complaint_remote_data_source.dart';
import 'package:sa7b/core/services/network_info.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../models/send_complaint_request_body.dart';
import '../models/send_complaint_response.dart';

class SendComplaintRepo {
  final SendComplaintRemoteDataSource sendComplaintRemoteDataSource;
  final NetworkInfo networkInfo;

  SendComplaintRepo({
    required this.sendComplaintRemoteDataSource,
    required this.networkInfo,
  });

  Future<SendComplaintResponse> sendComplaint(
    SendComplaintRequestBody sendComplaintRequest,
  ) async {
    final SendComplaintRequestBody sendComplaint = SendComplaintRequestBody(
      title: sendComplaintRequest.title,
      description: sendComplaintRequest.description,
      typeId: sendComplaintRequest.typeId,
      images: sendComplaintRequest.images,
    );

    if (await networkInfo.isConnected) {
      try {
        final response = await sendComplaintRemoteDataSource.sendComplaint(
          sendComplaint,
        );
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

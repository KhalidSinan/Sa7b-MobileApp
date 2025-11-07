import 'package:dio/dio.dart';
import 'package:sa7b/app/features/send_complaint/data/models/send_complaint_request_body.dart';
import 'package:sa7b/app/features/send_complaint/data/models/send_complaint_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';

abstract class SendComplaintRemoteDataSource {
  Future<SendComplaintResponse> sendComplaint(
    SendComplaintRequestBody sendComplaintRequest,
  );
}

class SendComplaintRemoteDataSourceImp
    implements SendComplaintRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  SendComplaintRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<SendComplaintResponse> sendComplaint(
    SendComplaintRequestBody sendComplaintRequest,
  ) async {
    final formMap = <String, dynamic>{
      'title': sendComplaintRequest.title,
      'description': sendComplaintRequest.description,
      'type_id': sendComplaintRequest.typeId,
    };
    if (sendComplaintRequest.images != null &&
        sendComplaintRequest.images!.isNotEmpty) {
      for (int i = 0; i < sendComplaintRequest.images!.length; i++) {
        final file = sendComplaintRequest.images![i];
        formMap['images[$i]'] = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      }
    }

    final formData = FormData.fromMap(formMap);
    try {
      final result = await apiServicesImpl.post(
        AppUrl.addComplaint,
        formData: formData,
      );
      if (result is List) {
        final responses = SendComplaintResponse.fromJsonList(result);
        if (responses.isNotEmpty) {
          return responses.first;
        } else {
          throw const NetworkExceptions.unableToProcess();
        }
      } else if (result is Map<String, dynamic>) {
        return SendComplaintResponse.fromJson(result);
      } else {
        throw const NetworkExceptions.unableToProcess();
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}

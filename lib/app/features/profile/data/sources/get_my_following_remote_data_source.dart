import 'package:dio/dio.dart';

import '../../../../../core/data/sources/remote/app_url.dart' show AppUrl;
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';
import '../models/follow/my_following_response.dart';

abstract class GetMyFollowingRemoteDataSource {
  Future<MyFollowingResponse> getMyFollowing();
}

class GetMyFollowingRemoteDataSourceImp
    implements GetMyFollowingRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  GetMyFollowingRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<MyFollowingResponse> getMyFollowing() async {
    try {
      final result = await apiServicesImpl.get(AppUrl.following);
      return MyFollowingResponse.fromJson(result);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}

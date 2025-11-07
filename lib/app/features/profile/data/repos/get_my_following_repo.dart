import 'package:sa7b/app/features/profile/data/sources/get_my_following_remote_data_source.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/network_info.dart';
import '../models/follow/my_following_response.dart';

class GetMyFollowingRepo {
  final GetMyFollowingRemoteDataSource getMyFollowingRemoteDataSource;
  final NetworkInfo networkInfo;

  GetMyFollowingRepo({
    required this.getMyFollowingRemoteDataSource,
    required this.networkInfo,
  });

  Future<MyFollowingResponse> getMyFollowing() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await getMyFollowingRemoteDataSource.getMyFollowing();
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

import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';
import 'package:sa7b/app/features/profile/data/sources/profile_remote_data_source.dart';

import '../../../../../core/services/network_info.dart';
import '../models/posts/post_by_id_response.dart';

class ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepo({
    required this.profileRemoteDataSource,
    required this.networkInfo,
  });

  Future<ProfileResponse> profile() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.profile();
        return response;
      } catch (e) {
        throw Exception('Failed to update profile: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  Future<PostByIdResponse> postById() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.postById();
        return response;
      } catch (e) {
        throw Exception('Failed to Fetch Posts : $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }
}

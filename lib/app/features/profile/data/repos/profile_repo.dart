import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';
import 'package:sa7b/app/features/profile/data/sources/profile_remote_data_source.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/network_info.dart';
import '../models/certificates/certificate_response.dart';
import '../models/follow/follow_and_unfollow_response.dart';
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
        print('Error: $e');
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PostByIdResponse> postById() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.postById();
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<CertificateResponse> certificateById() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.certificateById();
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<FollowAndUnfollowResponse> followUser(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.followUser(userId);
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<FollowAndUnfollowResponse> unFollowUser(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await profileRemoteDataSource.unFollowUser(userId);
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

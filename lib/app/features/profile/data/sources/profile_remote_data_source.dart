import 'package:dio/dio.dart';
import 'package:sa7b/app/features/profile/data/models/certificates/certificate_response.dart';
import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';
import '../models/follow/follow_and_unfollow_response.dart';
import '../models/posts/post_by_id_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> profile();
  Future<PostByIdResponse> postById();
  Future<CertificateResponse> certificateById();
  Future<FollowAndUnfollowResponse> followUser(int userId);
  Future<FollowAndUnfollowResponse> unFollowUser(int userId);
}

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProfileRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<ProfileResponse> profile() async {
    try {
      final response = await apiServicesImpl.get(AppUrl.account);
      return ProfileResponse.fromJson(response);
    } on DioException catch (e) {
      print('DioException: $e');
      throw NetworkExceptions.getException(e);
    } catch (e) {
      print('General Exception: $e');
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PostByIdResponse> postById() async {
    try {
      final postById = await apiServicesImpl.get("${AppUrl.postById}/1");
      return PostByIdResponse.fromJson(postById);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<CertificateResponse> certificateById() async {
    try {
      final certificateById = await apiServicesImpl.get(AppUrl.certificates);
      return CertificateResponse.fromJson(certificateById);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<FollowAndUnfollowResponse> followUser(int userId) async {
    try {
      final result = await apiServicesImpl.post(
        "${AppUrl.followers}/$userId/follow",
      );
      return FollowAndUnfollowResponse.fromJson(result);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<FollowAndUnfollowResponse> unFollowUser(int userId) async {
    try {
      final result = await apiServicesImpl.post(
        "${AppUrl.followers}/$userId/unfollow",
      );
      return FollowAndUnfollowResponse.fromJson(result);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/services/api_services_impl.dart';
import '../models/posts/post_by_id_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> profile();
  Future<PostByIdResponse> postById();
}

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProfileRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<ProfileResponse> profile() async {
    try {
      final response = await apiServicesImpl.get(
        AppUrl.account,
      );
      return ProfileResponse.fromJson(response);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PostByIdResponse> postById() async {
    try {
      final postById = await apiServicesImpl.get(
        "${AppUrl.postById}/1",
      );
      return PostByIdResponse.fromJson(postById);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}

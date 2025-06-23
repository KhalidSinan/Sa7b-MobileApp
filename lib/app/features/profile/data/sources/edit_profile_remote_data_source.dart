import 'package:dio/dio.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/services/api_services_impl.dart';
import '../models/edit_profile/edit_profile_request_body.dart';
import '../models/edit_profile/edit_profile_response.dart';

abstract class EditProfileRemoteDataSource {
  Future<EditProfileResponse> editProfile(EditProfileRequestBody editProfile);
}

class EditProfileRemoteDataSourceImp implements EditProfileRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  EditProfileRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<EditProfileResponse> editProfile(
    EditProfileRequestBody editProfile,
  ) async {
    final formMap = <String, dynamic>{
      'first_name': editProfile.firstName,
      'middle_name': editProfile.middleName,
      'last_name': editProfile.lastName,
      'academic_year_id': editProfile.academicYear,
      'bio': editProfile.bio,
      'linkedln_account': editProfile.linkedinAccount,
      'facebook_account': editProfile.facebookAccount,
      'github_account': editProfile.githubAccount,
      'x_account': editProfile.xAccount,
      'phone_number': editProfile.phoneNumber,
    };

    if (editProfile.image != null) {
      formMap['image'] = await MultipartFile.fromFile(
        editProfile.image!.path,
        filename: editProfile.image!.path.split('/').last,
      );
    }

    if (editProfile.skills != null && editProfile.skills!.isNotEmpty) {
      for (int i = 0; i < editProfile.skills!.length; i++) {
        final skill = editProfile.skills![i];
        formMap['skills[$i]'] = skill;
      }
    }
    final formData = FormData.fromMap(formMap);

    try {
      // final formData = FormData.fromMap({
      //   'first_name': editProfile.firstName,
      //   'middle_name': editProfile.middleName,
      //   'last_name': editProfile.lastName,
      //   'skill_id': editProfile.skillId,
      //   'academic_year_id': editProfile.academicYearId,
      //   'bio': editProfile.bio,
      //   'linkedln_account': editProfile.linkedinAccount,
      //   'facebook_account': editProfile.facebookAccount,
      //   'github_account': editProfile.githubAccount,
      //   'x_account': editProfile.xAccount,
      //   'phone_number': editProfile.phoneNumber,
      //   if (editProfile.image != null)
      //     'image': await MultipartFile.fromFile(editProfile.image!),
      // });
      final result = await apiServicesImpl.post(
        AppUrl.editAccount,
        formData: formData,
      );

      return EditProfileResponse.fromJson(result);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}

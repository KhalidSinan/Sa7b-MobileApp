import 'package:sa7b/app/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:sa7b/app/features/profile/data/models/edit_profile/edit_profile_response.dart';

import '../../../../../core/services/network_info.dart';
import '../sources/edit_profile_remote_data_source.dart';

class EditProfileRepo {
  final EditProfileRemoteDataSource editProfileRemoteDataSource;
  final NetworkInfo networkInfo;
  EditProfileRepo({
    required this.editProfileRemoteDataSource,
    required this.networkInfo,
  });

  Future<EditProfileResponse> editProfile(
    EditProfileRequestBody editProfile,
  ) async {
    final EditProfileRequestBody editProfileModel = EditProfileRequestBody(
      image: editProfile.image,
      firstName: editProfile.firstName,
      middleName: editProfile.middleName,
      lastName: editProfile.lastName,
      skills: editProfile.skills,
      academicYear: editProfile.academicYear,
      bio: editProfile.bio,
      linkedinAccount: editProfile.linkedinAccount,
      facebookAccount: editProfile.facebookAccount,
      githubAccount: editProfile.githubAccount,
      xAccount: editProfile.xAccount,
      phoneNumber: editProfile.phoneNumber,
    );

    if (await networkInfo.isConnected) {
      try {
        final response = await editProfileRemoteDataSource.editProfile(
          editProfileModel,
        );
        return response;
      } catch (e) {
        throw Exception('Failed to update profile: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }
}

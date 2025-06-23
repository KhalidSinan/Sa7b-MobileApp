import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa7b/app/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:sa7b/app/features/profile/data/repos/edit_profile_repo.dart';

part '../../states/edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  EditProfileCubit(this._editProfileRepo) : super(EditProfileState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController xAccountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> selectedSkills = [];
  String? selectedAcademicYear;

  File? imageFile;

  void editProfile() async {
    if (selectedSkills.isEmpty) {
      emit(EditProfileState.error(error: 'الرجاء إضافة خبرة واحدة على الأقل'));
      return;
    }
    if (selectedAcademicYear == null) {
      emit(EditProfileState.error(error: 'الرجاء اختيار السنة الأكاديمية'));
      return;
    }
    emit(EditProfileState.loading());
    try {
      final request = EditProfileRequestBody(
        image: imageFile,
        firstName: firstNameController.text.trim(),
        middleName: middleNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        skills: selectedSkills,
        bio: bioController.text.trim(),
        linkedinAccount: linkedInController.text.trim(),
        facebookAccount: facebookController.text.trim(),
        githubAccount: githubController.text.trim(),
        xAccount: xAccountController.text.trim(),
        academicYear: selectedAcademicYear!,
        phoneNumber: phoneNumberController.text.trim(),
      );

      final response = await _editProfileRepo.editProfile(request);

      emit(EditProfileState.success(response.message));
    } catch (e) {
      emit(EditProfileState.error(error: e.toString()));
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        emit(EditProfileState.imagePicked(imageFile));
      }
    } catch (e) {
      emit(EditProfileState.error(error: 'حدث خطأ أثناء اختيار الصورة'));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    linkedInController.dispose();
    facebookController.dispose();
    githubController.dispose();
    xAccountController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}

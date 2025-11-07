import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa7b/app/features/send_complaint/data/repos/send_complaint_repo.dart';
import 'dart:io';

import 'package:sa7b/app/features/send_complaint/logic/states/send_complaint_state.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/models/send_complaint_request_body.dart';

class SendComplaintCubit extends Cubit<SendComplaintState> {
  final SendComplaintRepo _sendComplaintRepo;

  SendComplaintCubit(this._sendComplaintRepo)
    : super(const SendComplaintState.initial());

  File? image;

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int selectedTypeId = 1;

  final List<ComplaintType> complainType = [
    ComplaintType(id: 1, name: 'type1'),
    ComplaintType(id: 2, name: 'type2'),
    ComplaintType(id: 3, name: 'type3'),
  ];

  Future<void> sendComplaint({required List<File> images}) async {
    if (!formKey.currentState!.validate()) return;

    emit(SendComplaintState.loading());
    try {
      final request = SendComplaintRequestBody(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        typeId: selectedTypeId,
        images: images,
      );

      final response = await _sendComplaintRepo.sendComplaint(request);
      emit(SendComplaintState.success(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(SendComplaintState.error(error: message));
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(const SendComplaintState.imagePicked());
    }
  }

  void clearMedia() {
    image = null;
    emit(const SendComplaintState.mediaCleared());
  }

  // Future<void> pickFromGallery() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     emit(ImagePickerState.loaded(File(image.path)));
  //   }
  // }

  // Future<void> pickFromCamera() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     emit(ImagePickerState.loaded(File(image.path)));
  //   }
  // }

  // void clearImage() {
  //   emit(const ImagePickerState.initial());
  // }
}

class ComplaintType {
  final int id;
  final String name;
  ComplaintType({required this.id, required this.name});
}

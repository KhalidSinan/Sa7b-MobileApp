import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:sa7b/app/features/send_complaint/logic/states/image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(const ImagePickerState.initial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromGallery() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null){
      emit(ImagePickerState.loaded(File(image.path)));
    }
  }

  Future<void> pickFromCamera() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(image != null){
      emit(ImagePickerState.loaded(File(image.path)));
    }
  }
  void clearImage() {
    emit(const ImagePickerState.initial());
  }
}
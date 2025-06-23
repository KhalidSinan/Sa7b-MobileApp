import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa7b/app/features/profile/data/repos/edit_post_repo.dart';
import 'package:video_player/video_player.dart';

import '../../../data/models/posts/add_post/add_new_post_request_body.dart';
import '../../../data/models/posts/add_post/add_new_post_response.dart';

part '../../states/edit_post_state.dart';
part 'edit_post_cubit.freezed.dart';

class EditPostCubit extends Cubit<EditPostState> {
  final EditPostRepo _editPostRepo;
  EditPostCubit(this._editPostRepo) : super(EditPostState.initial());

  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  VideoPlayerController? videoController;
  File? pdfFile;
  String? selectedSubject = 'خوارزميات البحث';
  String selectedVisibility = 'public';

  final List<String> allSubjects = [
    '1 كومبايلر',
    'بنيان 2',
    'خوارزميات البحث',
    'نظم تشغيل 1',
    'هندسة 1',
    'برمجة تفرعية',
    'تسويق',
    'كومبايلر 2',
    'هندسة 2',
    'نظم وسائط متعددة',
  ];

  final List<String> visibilityOptions = ['public', 'private'];

  void initializePostData({
    required String title,
    required String visibility,
    required String description,
    File? imageFile,
    File? videoFile,
    File? pdf,
  }) async {
    descriptionController.text = description;
    selectedVisibility = visibility;

    image = imageFile;
    pdfFile = pdf;

    if (videoFile != null) {
      videoController?.dispose();
      videoController = VideoPlayerController.file(videoFile);
      await videoController!.initialize();
    }

    emit(const EditPostState.initialized());
  }

  void editPost({
    required String visibility,
    required List<File> files,
    required String title,
    required int id,
  }) async {
    if (!formKey.currentState!.validate()) return;

    emit(EditPostState.loading());
    try {
      final request = AddNewPostRequestBody(
        title: title,
        description: descriptionController.text.trim(),
        visibility: visibility,
        files: files,
      );

      final response = await _editPostRepo.editPost(id, request);
      emit(EditPostState.success(response));
    } catch (e) {
      emit(EditPostState.error(error: e.toString()));
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      videoController?.pause();
      videoController?.dispose();
      videoController = null;
      emit(const EditPostState.imagePicked());
    }
  }

  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      videoController?.pause();
      videoController?.dispose();

      final file = File(pickedFile.path);
      videoController = VideoPlayerController.file(file);

      await videoController!.initialize();
      videoController!.play();

      image = null;

      emit(const EditPostState.videoPicked());
    }
  }

  Future<void> pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      pdfFile = File(result.files.single.path!);
      image = null;
      videoController?.pause();
      videoController?.dispose();
      videoController = null;

      emit(const EditPostState.pdfPicked());
    }
  }

  void clearMedia() {
    image = null;
    pdfFile = null;
    videoController?.pause();
    videoController?.dispose();
    videoController = null;

    emit(const EditPostState.mediaCleared());
  }

  @override
  Future<void> close() {
    videoController?.dispose();
    return super.close();
  }
}

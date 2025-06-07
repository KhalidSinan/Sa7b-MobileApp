import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:video_player/video_player.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_text_field.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? _image;
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.dm),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 260.h,
            child: CustomTextField(hintText: AppStrings.writeWhateverYouWant),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(AppStrings.addMedia),
              horizontalSpace(10),
              IconButton(
                icon: Icon(Icons.video_library, color: AppColors.primary),
                onPressed: _pickVideo,
              ),
              IconButton(
                icon: Icon(Icons.image, color: AppColors.error),
                onPressed: _pickImage,
              ),
            ],
          ),

          if (_image != null)
            Padding(
              padding: EdgeInsets.only(top: 20.dm),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.file(_image!, height: 200.h),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.error),
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                  ),
                ],
              ),
            ),

          if (_videoController != null && _videoController!.value.isInitialized)
            Padding(
              padding: EdgeInsets.only(top: 20.dm),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_videoController!),
                        IconButton(
                          icon: Icon(
                            _videoController!.value.isPlaying
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            size: 48,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _videoController!.value.isPlaying
                                  ? _videoController!.pause()
                                  : _videoController!.play();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.error),
                    onPressed: () {
                      setState(() {
                        _videoController?.pause();
                        _videoController?.dispose();
                        _videoController = null;
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _videoController?.dispose();
        _videoController = null;
      });
    }
  }

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      _videoController?.dispose();
      _videoController = VideoPlayerController.file(File(pickedFile.path));
      await _videoController!.initialize();
      _videoController!.play();

      setState(() {
        _image = null;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/imports_manager.dart';
import '../../../data/models/posts/posts_list_response.dart';

class PostOrCertificateCard extends StatelessWidget {
  final String userName;
  final String date;
  final String content;
  final void Function()? onShowPopupMenu;
  final bool isOwner;
  final String? attachmentPath;
  final AttachmentType attachmentType;

  const PostOrCertificateCard({
    super.key,
    required this.userName,
    required this.date,
    required this.content,
    required this.onShowPopupMenu,
    required this.isOwner,
    this.attachmentPath,
    this.attachmentType = AttachmentType.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.dm),
      child: Padding(
        padding: EdgeInsets.all(12.0.dm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.defaultProfileImage),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontFamily: AppFonts.Cairo,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.s12.dm,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: AppFonts.Cairo,
                        fontWeight: AppFontWeight.regular,
                        fontSize: AppFontSize.s10.dm,
                        fontStyle: FontStyle.italic,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                if (isOwner )
                  Align(
                    alignment: Alignment.topLeft,
                    child:  IconButton(
                      onPressed: onShowPopupMenu,
                      icon: Icon(Icons.more_horiz, color: AppColors.secondary),
                    ),
                  ),
              ],
            ),
            verticalSpace(15),
            Text(
              content,
              style: TextStyle(
                fontFamily: AppFonts.Cairo,
                fontSize: AppFontSize.s12.dm,
              ),
            ),
            verticalSpace(15),
            if (attachmentPath != null && attachmentType != AttachmentType.none)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyBlue,
                    borderRadius: BorderRadius.circular(8.dm),
                  ),
                  height: 248.h,
                  width: 283.w,
                  child: _buildAttachmentWidget(
                    context,
                    attachmentType,
                    attachmentPath,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAttachmentWidget(
  BuildContext context,
  AttachmentType attachmentType,
  String? attachmentPath,
) {
  switch (attachmentType) {
    case AttachmentType.image:
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.dm),
        child: Image.network(
          attachmentPath!,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 50.dm),
        ),
      );
    case AttachmentType.video:
      return VideoAttachmentWidget(videoUrl: attachmentPath!);
    case AttachmentType.file:
      return FileAttachmentWidget(fileName: attachmentPath!);
    case AttachmentType.none:
      return SizedBox.shrink();
  }
}

class VideoAttachmentWidget extends StatefulWidget {
  final String videoUrl;

  const VideoAttachmentWidget({super.key, required this.videoUrl});

  @override
  State<VideoAttachmentWidget> createState() => _VideoAttachmentWidgetState();
}

class _VideoAttachmentWidgetState extends State<VideoAttachmentWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.videoUrl as Uri)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _controller.value.isInitialized
            ? ClipRRect(
              borderRadius: BorderRadius.circular(8.dm),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
            : CircularProgressIndicator(),
        IconButton(
          icon: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            size: 50.dm,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
              _isPlaying ? _controller.play() : _controller.pause();
            });
          },
        ),
      ],
    );
  }
}

class FileAttachmentWidget extends StatelessWidget {
  final String fileName;
  final String? fileUrl;

  const FileAttachmentWidget({
    super.key,
    required this.fileName,
    this.fileUrl =
        'https://drive.google.com/file/d/12bEtyS-PhcDIwl33qjJyAig2eup5osLK/view?usp=drive_link',
  });

  Future<void> _openFile(BuildContext context) async {
    if (fileUrl == null || fileUrl!.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('رابط الملف غير متوفر')));
      return;
    }

    final uri = Uri.parse(fileUrl!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('تعذر فتح الملف')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileExtension = fileName.split('.').last.toLowerCase();

    IconData fileIcon;
    switch (fileExtension) {
      case 'pdf':
        fileIcon = Icons.picture_as_pdf;
        break;
      case 'doc':
      case 'docx':
        fileIcon = Icons.description;
        break;
      case 'xls':
      case 'xlsx':
        fileIcon = Icons.table_chart;
        break;
      default:
        fileIcon = Icons.insert_drive_file;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(fileIcon, size: 50.dm, color: AppColors.secondary),
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.dm),
          child: Text(
            fileName,
            style: TextStyle(
              fontFamily: AppFonts.Cairo,
              fontSize: AppFontSize.s12.dm,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        verticalSpace(10),
        fileName != 'no Attachment'
            ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.dm),
                ),
              ),
              onPressed: () => _openFile(context),

              child: Text(
                'فتح الملف',
                style: TextStyle(
                  fontFamily: AppFonts.Cairo,
                  fontSize: AppFontSize.s12.dm,
                  color: AppColors.white,
                ),
              ),
            )
            : SizedBox(),
      ],
    );
  }
}

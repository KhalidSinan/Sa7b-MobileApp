import 'dart:io';

class EditPostArgs {
  final int id;
  final String title;
  final String description;
  final String visibility;
  final File? imageFile;
  final File? videoFile;
  final File? pdfFile;

  EditPostArgs({
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    this.imageFile,
    this.videoFile,
    this.pdfFile,
  });
}

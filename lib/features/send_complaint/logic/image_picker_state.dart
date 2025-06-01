import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'image_picker_state.freezed.dart';

@freezed
class ImagePickerState with _$ImagePickerState{
  const factory ImagePickerState.initial() = _initial;
  const factory ImagePickerState.loaded(File image) = _Loaded;
  const factory ImagePickerState.error() = _error;
}
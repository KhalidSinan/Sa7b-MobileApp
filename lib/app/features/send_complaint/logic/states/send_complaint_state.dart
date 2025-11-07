import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/send_complaint_response.dart';
part 'send_complaint_state.freezed.dart';

@freezed
class SendComplaintState<T> with _$SendComplaintState {
  const factory SendComplaintState.initial() = _initial;
  const factory SendComplaintState.loading() = Loading;
  const factory SendComplaintState.success(SendComplaintResponse response) =
      Success<T>;
  const factory SendComplaintState.error({required String error}) = Error;
  const factory SendComplaintState.imagePicked() = ImagePicked;
  const factory SendComplaintState.mediaCleared() = MediaCleared;
}

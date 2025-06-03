import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '../states/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
}

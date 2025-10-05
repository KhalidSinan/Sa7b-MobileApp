import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/delete_guidance/data/sources/delete_guidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/delete_guidance/logic/states/delete_guidance_state.dart';


class DeleteGuidanceCubit extends Cubit<DeleteGuidanceState> {
  final DeleteGuidanceRemoteDatasourceImpl service;
  DeleteGuidanceCubit(this.service) : super(DeleteGuidanceInitial());

  Future<void> deleteGuidance(int id, String token) async {
    emit(DeleteGuidanceLoading());
    try {
      await service.deleteGuidance(id);
      emit(DeleteGuidanceSuccess("Deleted successfully"));
    } catch (e) {
      emit(DeleteGuidanceError(e.toString()));
    }
  }
}

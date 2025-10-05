import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/update_guidance/data/model/update_guidance_model.dart';
import 'package:sa7b/app/features/academic_guidens/update_guidance/data/sources/update_guidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/update_guidance/logic/states/update_guidance_state.dart';


class UpdateGuidanceCubit extends Cubit<UpdateGuidanceState> {
  final UpdateGuidanceRemoteDatasource datasource;

  UpdateGuidanceCubit(this.datasource) : super(UpdateGuidanceInitial());

  Future<void> updateGuidance(UpdateGuidanceModel model) async {
    emit(UpdateGuidanceLoading());
    try {
      await datasource.updateGuidance(model);
      emit(UpdateGuidanceSuccess("تم تعديل الإرشاد بنجاح"));
    } catch (e) {
      emit(UpdateGuidanceError(e.toString()));
    }
  }
}

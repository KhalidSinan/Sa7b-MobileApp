import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/data/model/add_guidance_model.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/data/sources/add_guidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/logic/states/add_guidance_state.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';

class AcademicGuidanceCubit extends Cubit<AddAcademicGuidanceState> {
  final AddAcademicGuidanceRemoteDatasourceImpl service;

  AcademicGuidanceCubit(this.service) : super(AcademicGuidanceInitial());

  Future<void> addGuidance(AcademicGuidanceModel model) async {
    emit(AcademicGuidanceLoading());
    try {
      await service.addAcademicGuidance(model);
      emit(AcademicGuidanceSuccess());
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AcademicGuidanceError(message));
    }
  }
}

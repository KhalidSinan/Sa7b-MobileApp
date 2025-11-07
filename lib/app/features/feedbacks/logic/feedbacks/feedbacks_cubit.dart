import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/feedbacks/data/models/feedbacks_response.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/repos/feedbacks_repo.dart';

part 'feedbacks_state.dart';
part 'feedbacks_cubit.freezed.dart';

class FeedbacksCubit extends Cubit<FeedbacksState> {
  final FeedbacksRepo _feedbacksRepo;

  FeedbacksCubit(this._feedbacksRepo) : super(FeedbacksState.initial());

  Future<void> feedbacks() async {
    emit(FeedbacksState.loading());
    try {
      final feedbacks = await _feedbacksRepo.feedbacks();
      emit(FeedbacksState.success(feedbacks));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(FeedbacksState.error(errMessage: message));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/filter_guidance/data/sources/filter_guidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/filter_guidance/logic/states/filter_guidance_state.dart';

class DateFilterCubit extends Cubit<DateFilterState> {
  final DateFilterService service;
  DateFilterCubit(this.service) : super(DateFilterInitial());

  void fetchPostsByDate(String start, String end) async {
    emit(DateFilterLoading());
    try {
      final posts = await service.fetchPostsByDate(
        startDate: start,
        endDate: end,
      );
      emit(DateFilterLoaded(posts));
    } catch (e) {
      emit(DateFilterError(e.toString()));
    }
  }
}

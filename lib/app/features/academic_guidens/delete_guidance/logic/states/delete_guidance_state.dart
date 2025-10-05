import 'package:equatable/equatable.dart';

abstract class DeleteGuidanceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteGuidanceInitial extends DeleteGuidanceState {}

class DeleteGuidanceLoading extends DeleteGuidanceState {}

class DeleteGuidanceSuccess extends DeleteGuidanceState {
  final String message;
  DeleteGuidanceSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class DeleteGuidanceError extends DeleteGuidanceState {
  final String message;
  DeleteGuidanceError(this.message);

  @override
  List<Object?> get props => [message];
}


abstract class AddAcademicGuidanceState {}

class AcademicGuidanceInitial extends AddAcademicGuidanceState {}

class AcademicGuidanceLoading extends AddAcademicGuidanceState {}

class AcademicGuidanceSuccess extends AddAcademicGuidanceState {}

class AcademicGuidanceError extends AddAcademicGuidanceState   {
  final String message;
  AcademicGuidanceError(this.message);
}
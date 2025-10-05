import 'package:get_it/get_it.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AcademicGuidanceRemoteDatasource {
  Future<List<SubjectGuidensModel>> getCourseGuidance(int courseId);
}

class AcademicGuidanceRemoteDatasourceImpl
    implements AcademicGuidanceRemoteDatasource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<List<SubjectGuidensModel>> getCourseGuidance(int courseId) async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.get(
        "${AppLink.getCourseGuidance}/$courseId",
        token: token,
      );

      if (response["status"] != "success") {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل جلب البيانات.",
        );
      }

      final List<SubjectGuidensModel> list = (response["data"] as List)
          .map((item) => SubjectGuidensModel.fromJson(item))
          .toList();

      return list;
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}

// class AcademicGuidanceMockDatasource
//     implements AcademicGuidanceRemoteDatasource {
//   @override
//   Future<List<CourseGuidanceModel>> getCourseGuidance(int courseId) async {
//     await Future.delayed(const Duration(seconds: 1)); // محاكاة تأخير API

//     return [
//       CourseGuidanceModel(
//         id: 1,
//         studentId: 31,
//         courseId: courseId,
//         content: "شرح المادة النظري بشكل مبسط",
//         type: "theoretical",
//         voteCount: 5,
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         student: StudentModel(
//           id: 31,
//           firstName: "محمد",
//           middleName: null,
//           lastName: "العلي",
//           bio: "طالب هندسة معلوماتية",
//           phoneNumber: "099999999",
//           image: "https://i.pravatar.cc/150?img=1", // صورة افتراضية Mock
//           linkedIn: null,
//           facebook: null,
//           github: null,
//           x: null,
//           userId: 1,
//           collegeId: 2,
//         ),
//         votes: [
//           VoteModel(
//             id: 1,
//             studentId: 31,
//             academicGuidanceId: 1,
//             type: "up",
//             createdAt: DateTime.now(),
//             updatedAt: DateTime.now(),
//           ),
//         ],
//       ),
//       CourseGuidanceModel(
//         id: 2,
//         studentId: 32,
//         courseId: courseId,
//         content: "حل مسائل عملية مهمة",
//         type: "practical",
//         voteCount: 2,
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         student: StudentModel(
//           id: 32,
//           firstName: "سارة",
//           middleName: "أحمد",
//           lastName: "خليل",
//           bio: "طالبة سنة ثالثة",
//           phoneNumber: "098888888",
//           image: "https://i.pravatar.cc/150?img=2",
//           linkedIn: null,
//           facebook: null,
//           github: null,
//           x: null,
//           userId: 2,
//           collegeId: 2,
//         ),
//         votes: [],
//       ),
//       CourseGuidanceModel(
//         id: 3,
//         studentId: 33,
//         courseId: courseId,
//         content: "كيف ممكن نستفيد من المادة بمجال العمل",
//         type: "benefit",
//         voteCount: 7,
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         student: StudentModel(
//           id: 33,
//           firstName: "ليلى",
//           middleName: null,
//           lastName: "يوسف",
//           bio: "طالبة هندسة",
//           phoneNumber: "097777777",
//           image: "https://i.pravatar.cc/150?img=3",
//           linkedIn: null,
//           facebook: null,
//           github: null,
//           x: null,
//           userId: 3,
//           collegeId: 2,
//         ),
//         votes: [],
//       ),
//     ];
//   }
// }

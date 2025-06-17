import '../../../domain/error_handler/network_exceptions.dart';

typedef OnLoading = void Function();
typedef OnSuccess<T> = void Function(T data);
typedef OnFailure = void Function(String errorMessage);

class ApiRequest {
  static Future<void> handle<T>({
    required Future<T> Function() request,
    required OnLoading onLoading,
    required OnSuccess<T> onSuccess,
    required OnFailure onFailure,
  }) async {
    try {
      onLoading();
      final T response = await request();

      onSuccess(response);
    } catch (error) {
      final networkExceptionMessage = NetworkExceptions.getErrorMessage(
        NetworkExceptions.getException(error),
      );
      onFailure(networkExceptionMessage);
    }
  }
}

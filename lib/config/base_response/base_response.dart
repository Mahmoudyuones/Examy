import '../error_handler/error_handler.dart';

sealed class BaseResponse<T> {
  const BaseResponse();

  const factory BaseResponse.success(T data) = Success<T>;

  factory BaseResponse.failure(ErrorHandler errorHandler) = Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler error) failure,
  });
}

final class Success<T> extends BaseResponse<T> {
  final T data;
  const Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler error) failure,
  }) =>
      success(data);
}

final class Failure<T> extends BaseResponse<T> {
  final ErrorHandler errorHandler;
  const Failure(this.errorHandler);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler error) failure,
  }) =>
      failure(errorHandler);
}

extension BaseResponseX<T> on BaseResponse<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Failure() => null,
  };

  ErrorHandler? get errorOrNull => switch (this) {
    Success() => null,
    Failure(:final errorHandler) => errorHandler,
  };
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_question_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FeedbackQuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackQuestionStateCopyWith<$Res> {
  factory $FeedbackQuestionStateCopyWith(
    FeedbackQuestionState value,
    $Res Function(FeedbackQuestionState) then,
  ) = _$FeedbackQuestionStateCopyWithImpl<$Res, FeedbackQuestionState>;
}

/// @nodoc
class _$FeedbackQuestionStateCopyWithImpl<
  $Res,
  $Val extends FeedbackQuestionState
>
    implements $FeedbackQuestionStateCopyWith<$Res> {
  _$FeedbackQuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FeedbackQuestionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FeedbackQuestionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FeedbackQuestionState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FeedbackQuestionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FeedbackQuestionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements FeedbackQuestionState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessSubmitQuestionImplCopyWith<$Res> {
  factory _$$SuccessSubmitQuestionImplCopyWith(
    _$SuccessSubmitQuestionImpl value,
    $Res Function(_$SuccessSubmitQuestionImpl) then,
  ) = __$$SuccessSubmitQuestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FeedbackQuestionResponse response});
}

/// @nodoc
class __$$SuccessSubmitQuestionImplCopyWithImpl<$Res>
    extends
        _$FeedbackQuestionStateCopyWithImpl<$Res, _$SuccessSubmitQuestionImpl>
    implements _$$SuccessSubmitQuestionImplCopyWith<$Res> {
  __$$SuccessSubmitQuestionImplCopyWithImpl(
    _$SuccessSubmitQuestionImpl _value,
    $Res Function(_$SuccessSubmitQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _$SuccessSubmitQuestionImpl(
        null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                as FeedbackQuestionResponse,
      ),
    );
  }
}

/// @nodoc

class _$SuccessSubmitQuestionImpl implements SuccessSubmitQuestion {
  const _$SuccessSubmitQuestionImpl(this.response);

  @override
  final FeedbackQuestionResponse response;

  @override
  String toString() {
    return 'FeedbackQuestionState.successSubmitQuestion(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessSubmitQuestionImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessSubmitQuestionImplCopyWith<_$SuccessSubmitQuestionImpl>
  get copyWith =>
      __$$SuccessSubmitQuestionImplCopyWithImpl<_$SuccessSubmitQuestionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) {
    return successSubmitQuestion(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) {
    return successSubmitQuestion?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (successSubmitQuestion != null) {
      return successSubmitQuestion(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) {
    return successSubmitQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) {
    return successSubmitQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (successSubmitQuestion != null) {
      return successSubmitQuestion(this);
    }
    return orElse();
  }
}

abstract class SuccessSubmitQuestion implements FeedbackQuestionState {
  const factory SuccessSubmitQuestion(final FeedbackQuestionResponse response) =
      _$SuccessSubmitQuestionImpl;

  FeedbackQuestionResponse get response;

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessSubmitQuestionImplCopyWith<_$SuccessSubmitQuestionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessGetFeedbackByIdImplCopyWith<$Res> {
  factory _$$SuccessGetFeedbackByIdImplCopyWith(
    _$SuccessGetFeedbackByIdImpl value,
    $Res Function(_$SuccessGetFeedbackByIdImpl) then,
  ) = __$$SuccessGetFeedbackByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FeedbackByIdResponse response});
}

/// @nodoc
class __$$SuccessGetFeedbackByIdImplCopyWithImpl<$Res>
    extends
        _$FeedbackQuestionStateCopyWithImpl<$Res, _$SuccessGetFeedbackByIdImpl>
    implements _$$SuccessGetFeedbackByIdImplCopyWith<$Res> {
  __$$SuccessGetFeedbackByIdImplCopyWithImpl(
    _$SuccessGetFeedbackByIdImpl _value,
    $Res Function(_$SuccessGetFeedbackByIdImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _$SuccessGetFeedbackByIdImpl(
        null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                as FeedbackByIdResponse,
      ),
    );
  }
}

/// @nodoc

class _$SuccessGetFeedbackByIdImpl implements SuccessGetFeedbackById {
  const _$SuccessGetFeedbackByIdImpl(this.response);

  @override
  final FeedbackByIdResponse response;

  @override
  String toString() {
    return 'FeedbackQuestionState.successGetFeedbackById(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessGetFeedbackByIdImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessGetFeedbackByIdImplCopyWith<_$SuccessGetFeedbackByIdImpl>
  get copyWith =>
      __$$SuccessGetFeedbackByIdImplCopyWithImpl<_$SuccessGetFeedbackByIdImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) {
    return successGetFeedbackById(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) {
    return successGetFeedbackById?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (successGetFeedbackById != null) {
      return successGetFeedbackById(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) {
    return successGetFeedbackById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) {
    return successGetFeedbackById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (successGetFeedbackById != null) {
      return successGetFeedbackById(this);
    }
    return orElse();
  }
}

abstract class SuccessGetFeedbackById implements FeedbackQuestionState {
  const factory SuccessGetFeedbackById(final FeedbackByIdResponse response) =
      _$SuccessGetFeedbackByIdImpl;

  FeedbackByIdResponse get response;

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessGetFeedbackByIdImplCopyWith<_$SuccessGetFeedbackByIdImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$FeedbackQuestionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMessage = null}) {
    return _then(
      _$ErrorImpl(
        null == errMessage
            ? _value.errMessage
            : errMessage // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.errMessage);

  @override
  final String errMessage;

  @override
  String toString() {
    return 'FeedbackQuestionState.error(errMessage: $errMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errMessage, errMessage) ||
                other.errMessage == errMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMessage);

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(FeedbackQuestionResponse response)
    successSubmitQuestion,
    required TResult Function(FeedbackByIdResponse response)
    successGetFeedbackById,
    required TResult Function(String errMessage) error,
  }) {
    return error(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult? Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult? Function(String errMessage)? error,
  }) {
    return error?.call(errMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(FeedbackQuestionResponse response)? successSubmitQuestion,
    TResult Function(FeedbackByIdResponse response)? successGetFeedbackById,
    TResult Function(String errMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SuccessSubmitQuestion value)
    successSubmitQuestion,
    required TResult Function(SuccessGetFeedbackById value)
    successGetFeedbackById,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult? Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SuccessSubmitQuestion value)? successSubmitQuestion,
    TResult Function(SuccessGetFeedbackById value)? successGetFeedbackById,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements FeedbackQuestionState {
  const factory Error(final String errMessage) = _$ErrorImpl;

  String get errMessage;

  /// Create a copy of FeedbackQuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

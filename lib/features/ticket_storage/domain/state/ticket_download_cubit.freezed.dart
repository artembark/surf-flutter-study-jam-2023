// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_download_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketDownloadState {
  bool get isLoading => throw _privateConstructorUsedError;
  TicketEntity? get ticketEntity => throw _privateConstructorUsedError;
  CancelToken? get cancelToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketDownloadStateCopyWith<TicketDownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDownloadStateCopyWith<$Res> {
  factory $TicketDownloadStateCopyWith(
          TicketDownloadState value, $Res Function(TicketDownloadState) then) =
      _$TicketDownloadStateCopyWithImpl<$Res, TicketDownloadState>;
  @useResult
  $Res call(
      {bool isLoading, TicketEntity? ticketEntity, CancelToken? cancelToken});

  $TicketEntityCopyWith<$Res>? get ticketEntity;
}

/// @nodoc
class _$TicketDownloadStateCopyWithImpl<$Res, $Val extends TicketDownloadState>
    implements $TicketDownloadStateCopyWith<$Res> {
  _$TicketDownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? ticketEntity = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketEntity: freezed == ticketEntity
          ? _value.ticketEntity
          : ticketEntity // ignore: cast_nullable_to_non_nullable
              as TicketEntity?,
      cancelToken: freezed == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as CancelToken?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TicketEntityCopyWith<$Res>? get ticketEntity {
    if (_value.ticketEntity == null) {
      return null;
    }

    return $TicketEntityCopyWith<$Res>(_value.ticketEntity!, (value) {
      return _then(_value.copyWith(ticketEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TicketDownloadStateCopyWith<$Res>
    implements $TicketDownloadStateCopyWith<$Res> {
  factory _$$_TicketDownloadStateCopyWith(_$_TicketDownloadState value,
          $Res Function(_$_TicketDownloadState) then) =
      __$$_TicketDownloadStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, TicketEntity? ticketEntity, CancelToken? cancelToken});

  @override
  $TicketEntityCopyWith<$Res>? get ticketEntity;
}

/// @nodoc
class __$$_TicketDownloadStateCopyWithImpl<$Res>
    extends _$TicketDownloadStateCopyWithImpl<$Res, _$_TicketDownloadState>
    implements _$$_TicketDownloadStateCopyWith<$Res> {
  __$$_TicketDownloadStateCopyWithImpl(_$_TicketDownloadState _value,
      $Res Function(_$_TicketDownloadState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? ticketEntity = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_$_TicketDownloadState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketEntity: freezed == ticketEntity
          ? _value.ticketEntity
          : ticketEntity // ignore: cast_nullable_to_non_nullable
              as TicketEntity?,
      cancelToken: freezed == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as CancelToken?,
    ));
  }
}

/// @nodoc

class _$_TicketDownloadState implements _TicketDownloadState {
  const _$_TicketDownloadState(
      {this.isLoading = false, this.ticketEntity, this.cancelToken});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TicketEntity? ticketEntity;
  @override
  final CancelToken? cancelToken;

  @override
  String toString() {
    return 'TicketDownloadState(isLoading: $isLoading, ticketEntity: $ticketEntity, cancelToken: $cancelToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketDownloadState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.ticketEntity, ticketEntity) ||
                other.ticketEntity == ticketEntity) &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, ticketEntity, cancelToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketDownloadStateCopyWith<_$_TicketDownloadState> get copyWith =>
      __$$_TicketDownloadStateCopyWithImpl<_$_TicketDownloadState>(
          this, _$identity);
}

abstract class _TicketDownloadState implements TicketDownloadState {
  const factory _TicketDownloadState(
      {final bool isLoading,
      final TicketEntity? ticketEntity,
      final CancelToken? cancelToken}) = _$_TicketDownloadState;

  @override
  bool get isLoading;
  @override
  TicketEntity? get ticketEntity;
  @override
  CancelToken? get cancelToken;
  @override
  @JsonKey(ignore: true)
  _$$_TicketDownloadStateCopyWith<_$_TicketDownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

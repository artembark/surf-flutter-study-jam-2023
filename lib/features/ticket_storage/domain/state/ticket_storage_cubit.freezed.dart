// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_storage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketStorageState {
  List<String> get tickets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketStorageStateCopyWith<TicketStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStorageStateCopyWith<$Res> {
  factory $TicketStorageStateCopyWith(
          TicketStorageState value, $Res Function(TicketStorageState) then) =
      _$TicketStorageStateCopyWithImpl<$Res, TicketStorageState>;
  @useResult
  $Res call({List<String> tickets});
}

/// @nodoc
class _$TicketStorageStateCopyWithImpl<$Res, $Val extends TicketStorageState>
    implements $TicketStorageStateCopyWith<$Res> {
  _$TicketStorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketStorageStateCopyWith<$Res>
    implements $TicketStorageStateCopyWith<$Res> {
  factory _$$_TicketStorageStateCopyWith(_$_TicketStorageState value,
          $Res Function(_$_TicketStorageState) then) =
      __$$_TicketStorageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tickets});
}

/// @nodoc
class __$$_TicketStorageStateCopyWithImpl<$Res>
    extends _$TicketStorageStateCopyWithImpl<$Res, _$_TicketStorageState>
    implements _$$_TicketStorageStateCopyWith<$Res> {
  __$$_TicketStorageStateCopyWithImpl(
      _$_TicketStorageState _value, $Res Function(_$_TicketStorageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
  }) {
    return _then(_$_TicketStorageState(
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_TicketStorageState implements _TicketStorageState {
  const _$_TicketStorageState({final List<String> tickets = const []})
      : _tickets = tickets;

  final List<String> _tickets;
  @override
  @JsonKey()
  List<String> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  String toString() {
    return 'TicketStorageState(tickets: $tickets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketStorageState &&
            const DeepCollectionEquality().equals(other._tickets, _tickets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tickets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketStorageStateCopyWith<_$_TicketStorageState> get copyWith =>
      __$$_TicketStorageStateCopyWithImpl<_$_TicketStorageState>(
          this, _$identity);
}

abstract class _TicketStorageState implements TicketStorageState {
  const factory _TicketStorageState({final List<String> tickets}) =
      _$_TicketStorageState;

  @override
  List<String> get tickets;
  @override
  @JsonKey(ignore: true)
  _$$_TicketStorageStateCopyWith<_$_TicketStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketEntity _$TicketEntityFromJson(Map<String, dynamic> json) {
  return _TicketEntity.fromJson(json);
}

/// @nodoc
mixin _$TicketEntity {
  String get id => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  TicketDownloadStatus get status => throw _privateConstructorUsedError;
  TicketType get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  int? get maxSize => throw _privateConstructorUsedError;
  int? get loadedSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
          TicketEntity value, $Res Function(TicketEntity) then) =
      _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call(
      {String id,
      String fileName,
      TicketDownloadStatus status,
      TicketType type,
      String url,
      DateTime createdAt,
      String? filePath,
      int? maxSize,
      int? loadedSize});
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? status = null,
    Object? type = null,
    Object? url = null,
    Object? createdAt = null,
    Object? filePath = freezed,
    Object? maxSize = freezed,
    Object? loadedSize = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketDownloadStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedSize: freezed == loadedSize
          ? _value.loadedSize
          : loadedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketEntityCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$_TicketEntityCopyWith(
          _$_TicketEntity value, $Res Function(_$_TicketEntity) then) =
      __$$_TicketEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fileName,
      TicketDownloadStatus status,
      TicketType type,
      String url,
      DateTime createdAt,
      String? filePath,
      int? maxSize,
      int? loadedSize});
}

/// @nodoc
class __$$_TicketEntityCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$_TicketEntity>
    implements _$$_TicketEntityCopyWith<$Res> {
  __$$_TicketEntityCopyWithImpl(
      _$_TicketEntity _value, $Res Function(_$_TicketEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? status = null,
    Object? type = null,
    Object? url = null,
    Object? createdAt = null,
    Object? filePath = freezed,
    Object? maxSize = freezed,
    Object? loadedSize = freezed,
  }) {
    return _then(_$_TicketEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketDownloadStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      loadedSize: freezed == loadedSize
          ? _value.loadedSize
          : loadedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketEntity extends _TicketEntity {
  const _$_TicketEntity(
      {required this.id,
      required this.fileName,
      required this.status,
      required this.type,
      required this.url,
      required this.createdAt,
      this.filePath,
      this.maxSize,
      this.loadedSize})
      : super._();

  factory _$_TicketEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TicketEntityFromJson(json);

  @override
  final String id;
  @override
  final String fileName;
  @override
  final TicketDownloadStatus status;
  @override
  final TicketType type;
  @override
  final String url;
  @override
  final DateTime createdAt;
  @override
  final String? filePath;
  @override
  final int? maxSize;
  @override
  final int? loadedSize;

  @override
  String toString() {
    return 'TicketEntity(id: $id, fileName: $fileName, status: $status, type: $type, url: $url, createdAt: $createdAt, filePath: $filePath, maxSize: $maxSize, loadedSize: $loadedSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.maxSize, maxSize) || other.maxSize == maxSize) &&
            (identical(other.loadedSize, loadedSize) ||
                other.loadedSize == loadedSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, status, type, url,
      createdAt, filePath, maxSize, loadedSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketEntityCopyWith<_$_TicketEntity> get copyWith =>
      __$$_TicketEntityCopyWithImpl<_$_TicketEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketEntityToJson(
      this,
    );
  }
}

abstract class _TicketEntity extends TicketEntity {
  const factory _TicketEntity(
      {required final String id,
      required final String fileName,
      required final TicketDownloadStatus status,
      required final TicketType type,
      required final String url,
      required final DateTime createdAt,
      final String? filePath,
      final int? maxSize,
      final int? loadedSize}) = _$_TicketEntity;
  const _TicketEntity._() : super._();

  factory _TicketEntity.fromJson(Map<String, dynamic> json) =
      _$_TicketEntity.fromJson;

  @override
  String get id;
  @override
  String get fileName;
  @override
  TicketDownloadStatus get status;
  @override
  TicketType get type;
  @override
  String get url;
  @override
  DateTime get createdAt;
  @override
  String? get filePath;
  @override
  int? get maxSize;
  @override
  int? get loadedSize;
  @override
  @JsonKey(ignore: true)
  _$$_TicketEntityCopyWith<_$_TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

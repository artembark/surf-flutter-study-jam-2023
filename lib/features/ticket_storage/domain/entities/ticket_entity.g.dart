// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketEntity _$$_TicketEntityFromJson(Map<String, dynamic> json) =>
    _$_TicketEntity(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      status: $enumDecode(_$TicketDownloadStatusEnumMap, json['status']),
      type: $enumDecode(_$TicketTypeEnumMap, json['type']),
      url: json['url'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      filePath: json['filePath'] as String?,
      maxSize: json['maxSize'] as int?,
      loadedSize: json['loadedSize'] as int?,
    );

Map<String, dynamic> _$$_TicketEntityToJson(_$_TicketEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'status': _$TicketDownloadStatusEnumMap[instance.status]!,
      'type': _$TicketTypeEnumMap[instance.type]!,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'filePath': instance.filePath,
      'maxSize': instance.maxSize,
      'loadedSize': instance.loadedSize,
    };

const _$TicketDownloadStatusEnumMap = {
  TicketDownloadStatus.readyToDownload: 'readyToDownload',
  TicketDownloadStatus.downloading: 'downloading',
  TicketDownloadStatus.paused: 'paused',
  TicketDownloadStatus.downloaded: 'downloaded',
  TicketDownloadStatus.error: 'error',
};

const _$TicketTypeEnumMap = {
  TicketType.train: 'train',
  TicketType.bus: 'bus',
  TicketType.plane: 'plane',
  TicketType.museum: 'museum',
  TicketType.undefined: 'undefined',
};

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_download_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domain/entities/ticket_type.dart';

part 'ticket_entity.freezed.dart';

part 'ticket_entity.g.dart';

@freezed
class TicketEntity with _$TicketEntity {
  const TicketEntity._();

  const factory TicketEntity({
    required String id,
    required String fileName,
    required TicketDownloadStatus status,
    required TicketType type,
    required String url,
    required DateTime createdAt,
    String? filePath,
    int? maxSize,
    int? loadedSize,
  }) = _TicketEntity;

  factory TicketEntity.fromJson(Map<String, dynamic> json) =>
      _$TicketEntityFromJson(json);
}

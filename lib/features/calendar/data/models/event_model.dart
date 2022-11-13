import '../../../../shared/const/consts.dart';
import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel(
      {required super.name,
      required super.description,
      required super.location,
      required super.color,
      required super.time,
      required super.date,
      required super.id});

  Map<String, dynamic> toMap() {
    return {
      EventFields.name: name,
      EventFields.description: description,
      EventFields.location: location,
      EventFields.color: color,
      EventFields.time: time,
      EventFields.date: date.toIso8601String(),
      EventFields.id: id
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      name: map[EventFields.name] ?? '',
      description: map[EventFields.description] ?? '',
      location: map[EventFields.location] ?? '',
      color: map[EventFields.color] ?? '',
      time: map[EventFields.time] ?? '',
      date: DateTime.parse(map[EventFields.date] ?? ''),
      id: map[EventFields.id] ?? '',
    );
  }

  factory EventModel.convert(EventEntity entity) {
    return EventModel(
      name: entity.name,
      description: entity.description,
      location: entity.location,
      color: entity.color,
      time: entity.time,
      date: entity.date,
      id: entity.id,
    );
  }
}

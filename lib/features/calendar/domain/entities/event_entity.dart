import 'package:equatable/equatable.dart';

import '../../data/models/event_model.dart';

class EventEntity extends Equatable {
  final String name;
  final String description;
  final String location;
  final int color;
  final String time;
  final DateTime date;
  final int id;

  const EventEntity({
    required this.name,
    required this.description,
    required this.location,
    required this.color,
    required this.time,
    required this.date,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [name, description, location, color, time, date, id];

  factory EventEntity.convert(EventModel model) {
    return EventEntity(
      name: model.name,
      description: model.description,
      location: model.location,
      color: model.color,
      time: model.time,
      date: model.date,
      id: model.id,
    );
  }
}

part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}


class CreateEvent extends EventsEvent{
  final EventEntity event;

  const CreateEvent({required this.event});
    @override
  List<Object> get props => [event];
}

class GetEvents extends EventsEvent{
    final DateTime date;
  final List<EventEntity> events;

  const GetEvents({required this.date, required this.events});
    @override
  List<Object> get props => [date, events];
}

class UpdateEvent extends EventsEvent{
  final EventEntity entity;

  const UpdateEvent({required this.entity});
    @override
  List<Object> get props => [entity];
}

class DeleteEvent extends EventsEvent{
  final String id;

  const DeleteEvent({required this.id});
    @override
  List<Object> get props => [id];
}


class ChangeEvent extends EventsEvent{}

class ChangeEventWithParams extends EventsEvent{
  final EventEntity entity;

  const ChangeEventWithParams({required this.entity});
}
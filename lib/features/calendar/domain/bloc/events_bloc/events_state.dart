part of 'events_bloc.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventAddedState extends EventsState {}

class EventGottenState extends EventsState {
  final List<EventEntity> events;

  const EventGottenState({required this.events});

  @override
  List<Object> get props => [events];
}

class EventUpdatedState extends EventsState {}

class EventDeletedState extends EventsState {}

class FailureState extends EventsState {
  final String error;

  const FailureState({required this.error});
  @override
  List<Object> get props => [error];
}

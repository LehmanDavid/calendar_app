import '../../repositories/events_repostirory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entities/event_entity.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository repository;
  EventsBloc({required this.repository}) : super(EventsInitial()) {
    on<CreateEvent>(_createEvent);
    on<GetEvents>(_getEvents);
    on<UpdateEvent>(_updateEvents);
    on<DeleteEvent>(_deleteEvents);
  }

  Future<void> _createEvent(
      CreateEvent event, Emitter<EventsState> emit) async {
    final result = await repository.createEvent(event.event);
    result
        ? emit(EventAddedState())
        : emit(const FailureState(
            error: "Something went wrong with creating events"));
  }

  Future<void> _getEvents(GetEvents event, Emitter<EventsState> emit) async {
    final result = await repository.getEvents(event.date);
    if (result.isNotEmpty) {
      emit(EventGottenState(events: result));
    } else {
      emit(const FailureState(
          error: "Something went wrong with getting events"));
    }
  }

  Future<void> _updateEvents(
      UpdateEvent event, Emitter<EventsState> emit) async {
    final result = await repository.updateEvent(event.entity);
    result
        ? emit(EventUpdatedState())
        : emit(const FailureState(
            error: "Something went wrong with updating events"));
  }

  Future<void> _deleteEvents(
      DeleteEvent event, Emitter<EventsState> emit) async {
    final result = await repository.deleteEvent(event.id);
    result
        ? emit(EventDeletedState())
        : emit(const FailureState(
            error: "Something went wrong with deleting events"));
  }
}

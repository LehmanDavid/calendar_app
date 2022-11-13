import '../entities/event_entity.dart';

abstract class EventsRepository {
  Future<bool> createEvent(EventEntity event);

  Future<List<EventEntity>> getEvents(DateTime date);

  Future<bool> deleteEvent(String idOfEvent);

  Future<bool> updateEvent(EventEntity event);
}

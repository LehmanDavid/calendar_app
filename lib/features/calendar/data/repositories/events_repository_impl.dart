import '../datasources/local_datasource.dart';
import '../models/event_model.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/events_repostirory.dart';
import '../../../../shared/errors/exceptions.dart';
import '../../../../shared/errors/failures.dart';

class EventsRepositoryImpl implements EventsRepository {
  final EventsLocalDatasourceImpl localDatasource;

  EventsRepositoryImpl({required this.localDatasource});
  @override
  Future<bool> createEvent(EventEntity event) async {
    try {
      final result =
          await localDatasource.createEvent(EventModel.convert(event));
      return result;
    } on CacheException {
      throw CacheFailure("Cache failure");
    } catch (e, stackTrace) {
      throw UnknownFailure(e.toString(), stackTrace.toString());
    }
  }

  @override
  Future<bool> deleteEvent(String idOfEvent) async {
    try {
      final result = await localDatasource.deleteEvent(idOfEvent);
      return result;
    } on CacheException {
      throw CacheFailure("Cache failure");
    } catch (e, stackTrace) {
      throw UnknownFailure(e.toString(), stackTrace.toString());
    }
  }

  @override
  Future<List<EventEntity>> getEvents(DateTime date) async {
    try {
      List<EventModel> list =
          await localDatasource.getEvents(date.toIso8601String());
      var eventEntityList =
          list.map((element) => EventEntity.convert(element)).toList();
      return eventEntityList;
    } on CacheException {
      throw CacheFailure("Cache failure");
    } catch (e, stackTrace) {
      throw UnknownFailure(e.toString(), stackTrace.toString());
    }
  }

  @override
  Future<bool> updateEvent(EventEntity event) async {
    try {
      final result =
          await localDatasource.updateEvent(EventModel.convert(event));
      return result;
    } on CacheException {
      throw CacheFailure("Cache failure");
    } catch (e, stackTrace) {
      throw UnknownFailure(e.toString(), stackTrace.toString());
    }
  }
}

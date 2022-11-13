import '../models/event_model.dart';
import '../../../../shared/const/consts.dart';
import '../../../../shared/db/init_events_db.dart';

import '../../../../shared/helper/helper_functions.dart';

class EventsLocalDatasourceImpl {
  final InitEventsDatabase initDb;

  EventsLocalDatasourceImpl({required this.initDb});

  Future<bool> createEvent(EventModel eventModel) async {
    final db = await initDb.database;
    final id = await db.insert(eventsTable, eventModel.toMap());
    return id == 0 ? false : true;
  }

  Future<List<EventModel>> getEvents(String dateTimeIsoString) async {
    final db = await initDb.database;
    final maps = await db.query(
      eventsTable,
      columns: values,
      where: '${EventFields.date} = ?',
      whereArgs: [dateTimeIsoString],
    );

    return HelperFunctions.convertMapToEventModel(maps);
  }

  Future<bool> updateEvent(EventModel event) async {
    final db = await initDb.database;
    final id = await db.update(
      eventsTable,
      event.toMap(),
      where: "${EventFields.id} = ?",
      whereArgs: [event.id],
    );
    return id == 0 ? false : true;
  }

  Future<bool> deleteEvent(String idOfEvent) async {
    final db = await initDb.database;
    final id = await db.delete(
      eventsTable,
      where: "${EventFields.id} = ?",
      whereArgs: [idOfEvent],
    );
    return id == 0 ? false : true;
  }
}

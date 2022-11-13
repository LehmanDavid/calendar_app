import 'package:get_it/get_it.dart';

import 'features/calendar/data/datasources/local_datasource.dart';
import 'features/calendar/data/repositories/events_repository_impl.dart';
import 'features/calendar/domain/bloc/calendar_bloc/calendar_bloc.dart';
import 'features/calendar/domain/bloc/events_bloc/events_bloc.dart';
import 'features/calendar/domain/repositories/events_repostirory.dart';
import 'shared/db/init_events_db.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //blocs
  sl.registerFactory(() => CalendarBloc());
  sl.registerFactory(() => EventsBloc(repository: sl()));

//repositories

  sl.registerFactory<EventsRepository>(() => EventsRepositoryImpl(localDatasource: sl()));



//other
  sl.registerLazySingleton(() => InitEventsDatabase.instance);
  sl.registerLazySingleton(() => InitEventsDatabase);

  //datasources
  // sl.registerLazySingleton<EventsLocalDatasource>(
  //     () => EventsLocalDatasourceImpl(initDb: sl()));
      sl.registerLazySingleton(
      () => EventsLocalDatasourceImpl(initDb: sl()));
}

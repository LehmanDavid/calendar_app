import '../features/calendar/domain/bloc/calendar_bloc/calendar_bloc.dart';
import '../features/calendar/domain/bloc/events_bloc/events_bloc.dart';
import 'presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/calendar/presentation/pages/home_screen.dart';
import '../injection_container.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<CalendarBloc>()
              ..add(ChangeDateEvent(selectedDate: DateTime.now()))),
        BlocProvider(
          create: (context) => sl<EventsBloc>()
            ..add(
              GetEvents(
                date: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
                events: const [],
              ),
            ),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(),
      title: 'Calendar Event',
      home: const HomeScreen(),
    );
  }
}

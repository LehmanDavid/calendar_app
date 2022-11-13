import '../widgets/build_event_cards_widget.dart';
import '../widgets/buttons/go_to_add_event_screen_button.dart';
import '../widgets/calendar/calendar.dart';
import '../../../../shared/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/calendar_bloc/calendar_bloc.dart';
import '../widgets/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state is NewSelectedDate) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: HomeScreenAppBar(
                selectedDate: state.newSelectedDate,
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Calendar(
                    selectedDate: state.newSelectedDate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Schedule",
                        style: AppTheme.headline2,
                      ),
                      GoToAddEventScreenButton(
                        selectedDate: state.newSelectedDate,
                      )
                    ],
                  ),
                ),
                BuildEventCards(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

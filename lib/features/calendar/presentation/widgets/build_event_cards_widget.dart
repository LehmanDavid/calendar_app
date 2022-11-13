import '../pages/event_details_page.dart';
import 'event_card.dart';
import '../../../../shared/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bloc/events_bloc/events_bloc.dart';

class BuildEventCards extends StatelessWidget {
  BuildEventCards({super.key});
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        if (state is EventGottenState) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: ListView.builder(
                controller: controller,
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      EventCard(
                        eventEntity: state.events[index],
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventDetailsPage(
                                  eventEntity: state.events[index],
                                  selectedDate: state.events[index].date)));
                        },
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        } else if (state is FailureState) {
          return const Center(
            child: Text(
              "No events",
              style: AppTheme.headline2,
            ),
          );
        }
        return Container();
      },
    );
  }
}

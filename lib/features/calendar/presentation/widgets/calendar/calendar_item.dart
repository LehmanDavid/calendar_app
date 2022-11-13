import '../../../domain/bloc/calendar_bloc/calendar_bloc.dart';
import '../../../domain/bloc/events_bloc/events_bloc.dart';
import '../../../../../shared/presentation/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarItem extends StatelessWidget {
  final int index;
  final int daysInMonth;
  final int year;
  final int month;
  final DateTime selectedDate;
  const CalendarItem(
      {super.key,
      required this.index,
      required this.daysInMonth,
      required this.year,
      required this.month,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return index <= daysInMonth
        ? ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  context.read<EventsBloc>().add(GetEvents(
                      date: DateTime(year, month, index), events: const []));
                  context.read<CalendarBloc>().add(
                        ChangeDateEvent(
                          selectedDate: DateTime(year, month, index),
                        ),
                      );
                },
                child: Ink(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == selectedDate.day
                          ? AppColors.blue
                          : AppColors.white),
                  height: size.height / 18,
                  width: (size.width - 56) / 7,
                  child: Center(
                      child: Text(
                    index.toString(),
                    style: TextStyle(
                      color: index == selectedDate.day
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  )),
                ),
              ),
            ),
          )
        : Container();
  }
}

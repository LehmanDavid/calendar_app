part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class ChangeDateEvent extends CalendarEvent {
  final DateTime selectedDate;

  const ChangeDateEvent({required this.selectedDate});

  @override
  List<Object> get props => [selectedDate];
}

part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();  

  @override
  List<Object> get props => [];
}
class CalendarInitial extends CalendarState {}


class NewSelectedDate extends CalendarState{
  final DateTime newSelectedDate;

  const NewSelectedDate({required this.newSelectedDate});
    @override
  List<Object> get props => [newSelectedDate];
}
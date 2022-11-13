import '../../../domain/bloc/calendar_bloc/calendar_bloc.dart';
import 'calendar_item.dart';
import '../../../../../shared/const/consts.dart';
import '../../../../../shared/presentation/color/app_colors.dart';
import '../../../../../shared/presentation/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_drop_down_button.dart';

class Calendar extends StatelessWidget {
  final DateTime selectedDate;
  const Calendar({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    int year = selectedDate.year;
    int month = selectedDate.month;
    int startOfMonth = DateTime(year, month, 1).weekday;
    int daysInMonth = DateUtils.getDaysInMonth(year, month);

    int weeksInMonth =
        ((startOfMonth == 6 || startOfMonth == 7) && daysInMonth == 31) ||
                (startOfMonth == 7 && daysInMonth >= 30)
            ? 6
            : 5;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    Consts().months[selectedDate.month - 1],
                    style: AppTheme.headline2,
                  ),
                  const SizedBox(width: 10),
                  MyDropDownButon(
                      isMonth: false,
                      selectedDate: selectedDate,
                      items: 1001,
                      onChanged: (year) {
                        context.read<CalendarBloc>().add(ChangeDateEvent(
                            selectedDate: DateTime(year ?? selectedDate.year,
                                selectedDate.month, 1)));
                      }),
                  MyDropDownButon(
                    isMonth: true,
                    selectedDate: selectedDate,
                    items: 12,
                    onChanged: (month) {
                      context.read<CalendarBloc>().add(
                            ChangeDateEvent(
                              selectedDate:
                                  DateTime(selectedDate.year, month! + 1, 1),
                            ),
                          );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => context.read<CalendarBloc>().add(
                        ChangeDateEvent(
                            selectedDate: DateTime(year, selectedDate.month - 1,
                                selectedDate.day))),
                    child: Container(
                      width: 23,
                      height: 23,
                      decoration: const BoxDecoration(
                          color: AppColors.greyWithOpacity,
                          shape: BoxShape.circle),
                      child: const Icon(
                        CupertinoIcons.left_chevron,
                        color: AppColors.black,
                        size: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => context.read<CalendarBloc>().add(
                        ChangeDateEvent(
                            selectedDate: DateTime(year, selectedDate.month + 1,
                                selectedDate.day))),
                    child: Container(
                      width: 23,
                      height: 23,
                      decoration: const BoxDecoration(
                          color: AppColors.greyWithOpacity,
                          shape: BoxShape.circle),
                      child: const Icon(
                        CupertinoIcons.right_chevron,
                        color: AppColors.black,
                        size: 12,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Consts()
                .weekNameShort
                .map((s) => Container(
                      alignment: Alignment.center,
                      height: 45,
                      child: Text(
                        s,
                        style: const TextStyle(color: AppColors.grey),
                      ),
                    ))
                .toList(),
          ),
          for (int i = 0; i <= weeksInMonth; i++)
            Row(
              children: [
                for (int j = 1; j <= 7; j++)
                  j < startOfMonth && i == 0
                      ? Container(
                          width: 48,
                          
                        )
                      : CalendarItem(
                          index: (j + (i * 7) - (startOfMonth - 1)),
                          daysInMonth: daysInMonth,
                          year: year,
                          month: month,
                          selectedDate: selectedDate,
                        ),
              ],
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/const/consts.dart';
import '../../../../../shared/presentation/theme/app_theme.dart';

class MyDropDownButon extends StatelessWidget {
  const MyDropDownButon({
    Key? key,
    required this.selectedDate,
    required this.items,
    this.onChanged,
    required this.isMonth,
  }) : super(key: key);

  final DateTime selectedDate;
  final int items;
  final bool isMonth;
  final void Function(int?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: DropdownButton<int>(
            icon: const Icon(CupertinoIcons.chevron_down),
            iconSize: 12,
            elevation: 0,
            items: List.generate(
              items,
              (index) => DropdownMenuItem<int>(
                value: isMonth ? index : index + 1950,
                child: Text(
                  isMonth ? Consts().months[index] : '${1950 + index}',
                  style: AppTheme.subtitle1,
                ),
              ),
            ),
            onChanged: onChanged));
  }
}

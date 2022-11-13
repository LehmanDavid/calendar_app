import '../../../../shared/const/consts.dart';
import '../../../../shared/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HomeScreenAppBar extends StatelessWidget {
  final DateTime selectedDate;
  const HomeScreenAppBar({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        SvgPicture.asset('assets/svgs/notification.svg'),
        const SizedBox(width: 20)
      ],
      title: Column(
        children: [
          Text(Consts().weekNameFull[selectedDate.weekday - 1],
              style: AppTheme.headline2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  DateFormat.yMMMMd().format(
                    selectedDate,
                  ),
                  style: AppTheme.subtitle1),
              const SizedBox(width: 5.0),
            ],
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

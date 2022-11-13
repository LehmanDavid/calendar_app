import 'package:flutter/material.dart';

import '../../../../../shared/presentation/color/app_colors.dart';
import '../../pages/add_event_page.dart';

class GoToAddEventScreenButton extends StatelessWidget {
  final DateTime selectedDate;
  const GoToAddEventScreenButton({
    Key? key, required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.blue)),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddEventPage(
              selectedDate: selectedDate,
            ),
          ),
        ),
        child: const Text('+ Add Event'),
      ),
    );
  }
}

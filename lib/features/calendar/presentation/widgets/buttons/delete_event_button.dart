import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../shared/presentation/color/app_colors.dart';
import '../../../../../shared/presentation/theme/app_theme.dart';
import '../../../domain/bloc/events_bloc/events_bloc.dart';
import '../../../domain/entities/event_entity.dart';

class DeleteEventButton extends StatelessWidget {
  const DeleteEventButton({
    Key? key,
    required this.eventEntity,
  }) : super(key: key);

  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all(const Size.fromHeight(54)),
              backgroundColor:
                  MaterialStateProperty.all(AppColors.palered)),
          onPressed: () {
            context.read<EventsBloc>().add(DeleteEvent(id: eventEntity.id.toString()));
            Navigator.of(context).pop();
            context.read<EventsBloc>().add(GetEvents(date: eventEntity.date, events: const []));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svgs/bin.svg'),
              const SizedBox(width: 5),
              const Text(
                'Delete Event',
                style: AppTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

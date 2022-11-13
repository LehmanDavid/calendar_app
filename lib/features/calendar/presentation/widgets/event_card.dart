import 'package:flutter/material.dart';

import '../../../../shared/presentation/theme/app_theme.dart';
import '../../domain/entities/event_entity.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.eventEntity, required this.onTap})
      : super(key: key);
  final EventEntity eventEntity;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Color(eventEntity.color).withOpacity(0.2),
            border: Border(
              top: BorderSide(
                color: Color(eventEntity.color),
                width: 10.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventEntity.name,
                style: AppTheme.headline2.copyWith(
                  color: Color(eventEntity.color),
                ),
              ),
              Text(
                eventEntity.description,
                style: AppTheme.headline3.copyWith(
                  color: Color(eventEntity.color),
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    color: Color(eventEntity.color),
                  ),
                  Text(
                    eventEntity.time,
                    style: AppTheme.headline3.copyWith(
                      color: Color(eventEntity.color),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Icon(
                    Icons.location_on_rounded,
                    color: Color(eventEntity.color),
                  ),
                  Text(
                    eventEntity.location,
                    style: AppTheme.headline3.copyWith(
                      color: Color(eventEntity.color),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

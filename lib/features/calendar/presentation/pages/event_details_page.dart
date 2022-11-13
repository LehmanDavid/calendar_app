import '../../domain/entities/event_entity.dart';
import '../widgets/buttons/delete_event_button.dart';
import 'add_event_page.dart';
import '../../../../shared/presentation/color/app_colors.dart';
import '../../../../shared/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage(
      {super.key, required this.eventEntity, required this.selectedDate});
  final EventEntity eventEntity;
  final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(eventEntity.color),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: SvgPicture.asset('assets/svgs/back.svg'),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddEventPage(
                                    isToEdit: true,
                                    selectedDate: selectedDate,
                                    eventToEdit: eventEntity),
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svgs/pen.svg'),
                                const SizedBox(width: 5),
                                const Text(
                                  'Edit',
                                  style: AppTheme.subtitle2,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        eventEntity.name,
                        style: AppTheme.headline1,
                      ),
                      SizedBox(
                        height: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/clock.svg',
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  eventEntity.time,
                                  style: AppTheme.headline3,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/location.svg',
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  eventEntity.location,
                                  style: AppTheme.headline3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Reminder', style: AppTheme.bodyText1),
                    const SizedBox(height: 10),
                    const Text('15 minutes before', style: AppTheme.bodyText2),
                    const Padding(
                      padding: EdgeInsets.only(top: 22, bottom: 10),
                      child: Text("Description", style: AppTheme.bodyText1),
                    ),
                    Text(
                      eventEntity.description,
                      style: AppTheme.overline,
                    )
                  ],
                ),
              ),
            ],
          ),
          DeleteEventButton(eventEntity: eventEntity)
        ],
      ),
    );
  }
}

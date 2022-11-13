import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/const/consts.dart';
import '../../../../shared/presentation/color/app_colors.dart';
import '../../../../shared/presentation/theme/app_theme.dart';
import '../../domain/bloc/events_bloc/events_bloc.dart';
import '../../domain/entities/event_entity.dart';
import '../widgets/my_text_field.dart';

class AddEventPage extends StatefulWidget {
  final DateTime selectedDate;
  final EventEntity? eventToEdit;
  final bool? isToEdit;
  const AddEventPage(
      {super.key, required this.selectedDate, this.eventToEdit, this.isToEdit});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  late TextEditingController timeController;
  late int newValue;
  @override
  void initState() {
    newValue = AppColors.blue.value;
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    locationController = TextEditingController();
    timeController = TextEditingController();
    widget.isToEdit == true
        ? nameController.text = widget.eventToEdit!.name
        : null;
    widget.isToEdit == true
        ? descriptionController.text = widget.eventToEdit!.description
        : null;
    widget.isToEdit == true
        ? locationController.text = widget.eventToEdit!.location
        : null;
    widget.isToEdit == true
        ? timeController.text = widget.eventToEdit!.time
        : null;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 19, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Event name',
                    style: AppTheme.headline2,
                  ),
                  Form(
                    key: MyKeys.nameKey,
                    child: NameTextField(
                      controller: nameController,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Event description',
                    style: AppTheme.headline2,
                  ),
                  Form(
                    key: MyKeys.descriptionKey,
                    child: DescriptionTextField(
                      controller: descriptionController,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Event location',
                    style: AppTheme.headline2,
                  ),
                  Form(
                    key: MyKeys.locationKey,
                    child: LocationTextField(
                      controller: locationController,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Priority Color',
                    style: AppTheme.headline2,
                  ),
                  DropdownButton<int>(
                    items: [
                      DropdownMenuItem<int>(
                        value: AppColors.blue.value,
                        child: Container(
                          height: 20.0,
                          width: 24.0,
                          color: AppColors.blue,
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: AppColors.red.value,
                        child: Container(
                          height: 20.0,
                          width: 24.0,
                          color: AppColors.palered,
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: AppColors.orange.value,
                        child: Container(
                          height: 20.0,
                          width: 24.0,
                          color: AppColors.orange,
                        ),
                      )
                    ],
                    onChanged: (value) {
                      newValue = value!;
                      setState(() {
                        newValue;
                      });
                    },
                    value: newValue,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Event time',
                    style: AppTheme.headline2,
                  ),
                  Form(
                    key: MyKeys.timeKey,
                    child: TimeTextField(
                      controller: timeController,
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(46)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.blue)),
                    onPressed: () {
                      if (MyKeys.nameKey.currentState!.validate() &&
                          MyKeys.descriptionKey.currentState!.validate() &&
                          MyKeys.locationKey.currentState!.validate() &&
                          MyKeys.timeKey.currentState!.validate()) {
                        widget.isToEdit == true
                            ? {
                                context.read<EventsBloc>().add(
                                      UpdateEvent(
                                        entity: EventEntity(
                                          name: nameController.text,
                                          color: newValue,
                                          date: DateTime(
                                              widget.selectedDate.year,
                                              widget.selectedDate.month,
                                              widget.selectedDate.day),
                                          description:
                                              descriptionController.text,
                                          id: widget.eventToEdit!.id,
                                          location: locationController.text,
                                          time: timeController.text,
                                        ),
                                      ),
                                    ),
                                context.read<EventsBloc>().add(GetEvents(
                                    date: DateTime(
                                        widget.selectedDate.year,
                                        widget.selectedDate.month,
                                        widget.selectedDate.day),
                                    events: const [])),
                                Navigator.of(context)
                                  ..pop()
                                  ..pop()
                              }
                            : {
                                context.read<EventsBloc>().add(
                                      CreateEvent(
                                        event: EventEntity(
                                          name: nameController.text,
                                          color: newValue,
                                          date: DateTime(
                                              widget.selectedDate.year,
                                              widget.selectedDate.month,
                                              widget.selectedDate.day),
                                          description:
                                              descriptionController.text,
                                          id: DateTime.now().millisecond,
                                          location: locationController.text,
                                          time: timeController.text,
                                        ),
                                      ),
                                    ),
                                context.read<EventsBloc>().add(GetEvents(
                                    date: DateTime(
                                        widget.selectedDate.year,
                                        widget.selectedDate.month,
                                        widget.selectedDate.day),
                                    events: const [])),
                                Navigator.of(context).pop()
                              };
                      }
                    },
                    child: Text(
                      widget.isToEdit == true ? 'Update' : 'Add',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

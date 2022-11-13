import 'package:flutter/material.dart';

class Consts {
  List<String> weekNameShort = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  List<String> weekNameFull = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
}

class EventFields {
  static const String name = 'name';
  static const String description = 'description';
  static const String location = 'location';
  static const String color = 'color';
  static const String time = 'time';
  static const String date = 'date';
  static const String id = 'id';
}

const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
const textType = "TEXT NOT NULL";
const colorType = "INTEGER NOT NULL";
const eventsTable = "events";
const filePathToDB= "calendar.db";
const values = [
  EventFields.name,
  EventFields.description,
  EventFields.location,
  EventFields.color,
  EventFields.time,
  EventFields.date,
  EventFields.id,
];


class MyKeys {
  static final nameKey = GlobalKey<FormState>(debugLabel: '_nameFormKey');
  static final descriptionKey =
      GlobalKey<FormState>(debugLabel: '_descriptionFormKey');
  static final locationKey =
      GlobalKey<FormState>(debugLabel: '_locationFormKey');
  static final timeKey = GlobalKey<FormState>(debugLabel: '_timeFormKey');
}
import 'dart:ffi';

class DayScheduleModel {
  String day;
  String subjectName;
  String subjectType;
  String lector;
  String url;

  DayScheduleModel(
      this.day, this.subjectName, this.subjectType, this.lector, this.url);
}

class AirportItemModel {
  final String name;
  final String country_code;
  final Bool flightable;

  AirportItemModel({
    required this.name,
    required this.country_code,
    required this.flightable,
  });

  factory AirportItemModel.fromJson(Map<String, dynamic> json) => AirportItemModel(
    name: json['name'] as String,
    country_code: json['country_code'] as String,
    flightable: json['flightable'] as Bool,
  );
}
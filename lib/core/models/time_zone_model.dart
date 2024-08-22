import 'package:flutter/material.dart';

import 'dart:convert';

class TimezoneModel {
  final String utcOffset;
  final int dayOfWeek;
  final int dayOfYear;
  final DateTime utcDatetime;
  final DateTime datetime;
  final int dstOffset;
  final int weekNumber;
  final int unixtime;
  final String timezone;
  final int rawOffset;
  final bool dst;
  final String clientIp;
  final String abbreviation;

  TimezoneModel({
    required this.utcOffset,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.utcDatetime,
    required this.datetime,
    required this.dstOffset,
    required this.weekNumber,
    required this.unixtime,
    required this.timezone,
    required this.rawOffset,
    required this.dst,
    required this.clientIp,
    required this.abbreviation,
  });

  // Factory method to create a TimezoneData instance from a JSON map
  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      utcOffset: json['utc_offset'] as String,
      dayOfWeek: json['day_of_week'] as int,
      dayOfYear: json['day_of_year'] as int,
      utcDatetime: DateTime.parse(json['utc_datetime'] as String),
      datetime: DateTime.parse(json['datetime'] as String),
      dstOffset: json['dst_offset'] as int,
      weekNumber: json['week_number'] as int,
      unixtime: json['unixtime'] as int,
      timezone: json['timezone'] as String,
      rawOffset: json['raw_offset'] as int,
      dst: json['dst'] as bool,
      clientIp: json['client_ip'] as String,
      abbreviation: json['abbreviation'] as String,
    );
  }

  // Method to convert the TimezoneData instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'utc_offset': utcOffset,
      'day_of_week': dayOfWeek,
      'day_of_year': dayOfYear,
      'utc_datetime': utcDatetime.toIso8601String(),
      'datetime': datetime.toIso8601String(),
      'dst_offset': dstOffset,
      'week_number': weekNumber,
      'unixtime': unixtime,
      'timezone': timezone,
      'raw_offset': rawOffset,
      'dst': dst,
      'client_ip': clientIp,
      'abbreviation': abbreviation,
    };
  }
}
import 'package:statbotics/src/cast.dart';
import 'package:statbotics/src/data_stractures/stb_epa.dart';

class Event {
  final String key;
  final int year;
  final String name;
  final int time;
  final String country;
  final String state;
  final String district;
  final String startDate;
  final String endDate;
  final String type;
  final int week;
  final bool offseason;
  final String video;
  final String status;
  final String statusStr;
  final int numTeams;
  final int currentMatch;
  final int qualMatches;
  final Epa epa;
  final Map<String, dynamic> metrics;

  Event({
    required this.key,
    required this.year,
    required this.name,
    required this.time,
    required this.country,
    required this.state,
    required this.district,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.week,
    required this.offseason,
    required this.video,
    required this.status,
    required this.statusStr,
    required this.numTeams,
    required this.currentMatch,
    required this.qualMatches,
    required this.epa,
    required this.metrics,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      key: tryCast(json['key']) ?? 'Unknown Event',
      year: tryCast(json['year']) ?? 0,
      name: tryCast(json['name']) ?? 'Unnamed Event',
      time: tryCast(json['time']) ?? 0,
      country: tryCast(json['country']) ?? 'Unknown Country',
      state: tryCast(json['state']) ?? 'Unknown State',
      district: tryCast(json['district']) ?? 'Unknown District',
      startDate: tryCast(json['start_date']) ?? '1970-01-01',
      endDate: tryCast(json['end_date']) ?? '1970-01-01',
      type: tryCast(json['type']) ?? 'Unknown Type',
      week: tryCast(json['week']) ?? 0,
      offseason: tryCast(json['offseason']) ?? false,
      video: tryCast(json['video']) ?? 'No Video',
      status: tryCast(json['status']) ?? 'Unknown Status',
      statusStr: tryCast(json['status_str']) ?? 'Unknown Status',
      numTeams: tryCast(json['num_teams']) ?? 0,
      currentMatch: tryCast(json['current_match']) ?? 0,
      qualMatches: tryCast(json['qual_matches']) ?? 0,
      epa: Epa.fromJson(json['epa'] ?? {}),
      metrics: json['metrics'] ?? {},
    );
  }
}

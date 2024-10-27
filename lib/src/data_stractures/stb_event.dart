import 'package:statbotics/src/cast.dart';
import 'package:statbotics/src/data_stractures/stb_epa.dart';

/// A class representing an event with details such as location,
/// dates, type, and performance metrics.
class Event {
  /// Unique key identifying the event.
  final String key;

  /// The year the event took place.
  final int year;

  /// The name of the event.
  final String name;

  /// The timestamp of the event start time.
  final int time;

  /// The country where the event took place.
  final String country;

  /// The state where the event took place.
  final String state;

  /// The district associated with the event.
  final String district;

  /// The start date of the event in YYYY-MM-DD format.
  final String startDate;

  /// The end date of the event in YYYY-MM-DD format.
  final String endDate;

  /// The type of the event.
  final String type;

  /// The week number in which the event occurs.
  final int week;

  /// Indicates if the event is an offseason event.
  final bool offseason;

  /// The video URL associated with the event.
  final String video;

  /// The status of the event.
  final String status;

  /// A string representation of the event status.
  final String statusStr;

  /// The number of teams participating in the event.
  final int numTeams;

  /// The current match number at the event.
  final int currentMatch;

  /// The total number of qualification matches.
  final int qualMatches;

  /// An [Epa] object containing EPA (Estimated Performance Average) data for the event.
  final Epa epa;

  /// Additional performance and event metrics stored in a map.
  final Map<String, dynamic> metrics;

  /// Constructs an [Event] instance with the specified details.
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

  /// Creates an [Event] instance from a JSON [Map].
  ///
  /// The [json] parameter should contain keys corresponding to each
  /// field in the [Event] class. If any key is missing, a default
  /// value is assigned to the respective field.
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

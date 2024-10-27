import 'package:statbotics/src/cast.dart';

/// Represents a match in a competition, including details about teams,
/// scores, predictions, and status.
class Match {
  /// Unique identifier for the match.
  final String matchId;

  /// Identifier for the event in which the match took place.
  final String eventId;

  /// The type or level of the match (e.g., qualification, elimination).
  final String matchType;

  /// Score achieved by the red alliance in this match.
  final int redScore;

  /// Score achieved by the blue alliance in this match.
  final int blueScore;

  /// The year the match was played.
  final int year;

  /// Indicates if the match was part of an offseason event.
  final bool offseason;

  /// The week number of the event where the match occurred.
  final int week;

  /// Indicates if this match is part of the elimination rounds.
  final bool elim;

  /// The competition level of the match, such as qualification or finals.
  final String compLevel;

  /// The set number of the match within a series.
  final int setNumber;

  /// The match number within the event.
  final int matchNumber;

  /// The display name of the match.
  final String matchName;

  /// The time at which the match took place.
  final int time;

  /// The predicted time for the match start.
  final int predictedTime;

  /// The status of the match (e.g., scheduled, completed).
  final String status;

  /// URL for the match video.
  final String video;

  /// A list of team keys for teams in the red alliance.
  final List<String> redTeamKeys;

  /// A list of team keys for teams in the blue alliance.
  final List<String> blueTeamKeys;

  /// The predicted winner of the match (either "red" or "blue").
  final String predictedWinner;

  /// The probability of the red alliance winning, as a percentage.
  final double redWinProb;

  /// The predicted score for the red alliance.
  final double redScorePredicted;

  /// The predicted score for the blue alliance.
  final double blueScorePredicted;

  /// Constructs a [Match] instance with specified properties.
  Match({
    required this.matchId,
    required this.eventId,
    required this.matchType,
    required this.redScore,
    required this.blueScore,
    required this.year,
    required this.offseason,
    required this.week,
    required this.elim,
    required this.compLevel,
    required this.setNumber,
    required this.matchNumber,
    required this.matchName,
    required this.time,
    required this.predictedTime,
    required this.status,
    required this.video,
    required this.redTeamKeys,
    required this.blueTeamKeys,
    required this.predictedWinner,
    required this.redWinProb,
    required this.redScorePredicted,
    required this.blueScorePredicted,
  });

  /// Creates a [Match] instance from a JSON [Map].
  ///
  /// Parses values from the JSON map and assigns defaults
  /// where keys are missing or have null values.
  factory Match.fromJson(Map<String, dynamic> json) {
    final alliances = json['alliances'];
    final redAlliance = alliances['red'] ?? {};
    final blueAlliance = alliances['blue'] ?? {};

    return Match(
      matchId: tryCast(json['key']) ?? "N/A",
      eventId: tryCast(json['event']) ?? "N/A",
      matchType: tryCast(json['comp_level']) ?? "N/A",
      redScore: tryCast(json['result']['red_score']) ?? 0,
      blueScore: tryCast(json['result']['blue_score']) ?? 0,
      year: tryCast(json['year']) ?? 0,
      offseason: tryCast(json['offseason']) ?? false,
      week: tryCast(json['week']) ?? 0,
      elim: tryCast(json['elim']) ?? false,
      compLevel: tryCast(json['comp_level']) ?? "N/A",
      setNumber: tryCast(json['set_number']) ?? 0,
      matchNumber: tryCast(json['match_number']) ?? 0,
      matchName: tryCast(json['match_name']) ?? "N/A",
      time: tryCast(json['time']) ?? 0,
      predictedTime: tryCast(json['predicted_time']) ?? 0,
      status: tryCast(json['status']) ?? "N/A",
      video: tryCast(json['video']) ?? "N/A",
      redTeamKeys: List<String>.from(redAlliance['team_keys'] ?? []),
      blueTeamKeys: List<String>.from(blueAlliance['team_keys'] ?? []),
      predictedWinner: tryCast(json['pred']['winner']) ?? "N/A",
      redWinProb: tryCast(json['pred']['red_win_prob']) ?? 0.0,
      redScorePredicted: tryCast(json['pred']['red_score']) ?? 0.0,
      blueScorePredicted: tryCast(json['pred']['blue_score']) ?? 0.0,
    );
  }
}

import 'package:statbotics/src/cast.dart';

class Match {
  final String matchId;
  final String eventId;
  final String matchType;
  final int redScore;
  final int blueScore;
  final int year;
  final bool offseason;
  final int week;
  final bool elim;
  final String compLevel;
  final int setNumber;
  final int matchNumber;
  final String matchName;
  final int time;
  final int predictedTime;
  final String status;
  final String video;
  final List<String> redTeamKeys;
  final List<String> blueTeamKeys;
  final String predictedWinner;
  final double redWinProb;
  final double redScorePredicted;
  final double blueScorePredicted;

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

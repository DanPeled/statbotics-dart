import 'package:statbotics/src/cast.dart';
class TeamYearStats {
  final int teamNumber;
  final int year;
  final int wins;
  final int losses;
  final Map<String, dynamic> breakdown;

  TeamYearStats({
    required this.teamNumber,
    required this.year,
    required this.wins,
    required this.losses,
    required this.breakdown,
  });

  factory TeamYearStats.fromJson(Map<String, dynamic> json) {
    return TeamYearStats(
      teamNumber: tryCast(json['team'], defaultValue: 0) ?? 0, 
      year: tryCast(json['year']) ?? 0,
      wins: tryCast(json['record']['season']['wins']) ?? 0,
      losses: tryCast(json['record']['season']['losses']) ?? 0,
      breakdown: json['epa']['breakdown'] as Map<String, dynamic>,     );
  }
}

import 'package:statbotics/src/cast.dart';

/// Represents a team's statistics for a specific year.
class TeamYearStats {
  /// The team number.
  final int teamNumber;

  /// The year for which these statistics apply.
  final int year;

  /// The number of wins in the season.
  final int wins;

  /// The number of losses in the season.
  final int losses;

  /// A breakdown of the team's EPA (Expected Points Added) data.
  final Map<String, dynamic> breakdown;

  /// Constructs a [TeamYearStats] instance with the specified properties.
  TeamYearStats({
    required this.teamNumber,
    required this.year,
    required this.wins,
    required this.losses,
    required this.breakdown,
  });

  /// Creates a [TeamYearStats] instance from a JSON [Map].
  ///
  /// Fields like `teamNumber`, `year`, `wins`, and `losses` are extracted
  /// from the JSON, and [tryCast] is used to ensure data integrity.
  factory TeamYearStats.fromJson(Map<String, dynamic> json) {
    return TeamYearStats(
      teamNumber: tryCast(json['team'], defaultValue: 0) ?? 0,
      year: tryCast(json['year']) ?? 0,
      wins: tryCast(json['record']['season']['wins']) ?? 0,
      losses: tryCast(json['record']['season']['losses']) ?? 0,
      breakdown: json['epa']['breakdown'] as Map<String, dynamic>,
    );
  }
}

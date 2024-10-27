import 'package:statbotics/src/cast.dart';
import 'package:statbotics/src/data_stractures/stb_epa.dart';

/// Represents a team with details about its location, status, and performance.
class Team {
  /// Unique identifier for the team.
  final String team;

  /// The name of the team.
  final String name;

  /// The country in which the team is based.
  final String country;

  /// The state in which the team is based, if applicable.
  final String? state;

  /// The district to which the team belongs.
  final String district;

  /// The year the team began participating.
  final int rookieYear;

  /// Indicates if the team is participating in the offseason.
  final bool offseason;

  /// Indicates if the team is currently active.
  final bool active;

  /// The team's primary and secondary colors.
  final Colors colors;

  /// The team's match record for the current and full season.
  final Record record;

  /// The team's normalized EPA (Expected Points Added) score.
  final Epa normEpa;

  /// Constructs a [Team] instance with the specified properties.
  Team({
    required this.team,
    required this.name,
    required this.country,
    this.state,
    required this.district,
    required this.rookieYear,
    required this.offseason,
    required this.active,
    required this.colors,
    required this.record,
    required this.normEpa,
  });

  /// Creates a [Team] instance from a JSON [Map].
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      team: tryCast(json['team']) ?? "N/A",
      name: tryCast(json['name']) ?? "N/A",
      country: tryCast(json['country']) ?? "N/A",
      state: tryCast(json['state']),
      district: tryCast(json['district']) ?? "N/A",
      rookieYear: tryCast(json['rookie_year']) ?? 0,
      offseason: tryCast(json['offseason']) ?? false,
      active: tryCast(json['active']) ?? false,
      colors: Colors.fromJson(json['colors']),
      record: Record.fromJson(json['record']),
      normEpa: Epa.fromJson(json['norm_epa']),
    );
  }

  /// Converts the [Team] instance to a JSON [Map].
  Map<String, dynamic> toJson() {
    return {
      'team': team,
      'name': name,
      'country': country,
      'state': state,
      'district': district,
      'rookie_year': rookieYear,
      'offseason': offseason,
      'active': active,
      'colors': colors.toJson(),
      'record': record.toJson(),
      'norm_epa': normEpa.toJson(),
    };
  }
}

/// Represents the primary and secondary colors associated with a team.
class Colors {
  /// The primary color for the team.
  final String? primary;

  /// The secondary color for the team.
  final String? secondary;

  Colors({
    this.primary,
    this.secondary,
  });

  /// Creates a [Colors] instance from a JSON [Map].
  factory Colors.fromJson(Map<String, dynamic> json) {
    return Colors(
      primary: tryCast(json['primary']),
      secondary: tryCast(json['secondary']),
    );
  }

  /// Converts the [Colors] instance to a JSON [Map].
  Map<String, dynamic> toJson() {
    return {
      'primary': primary,
      'secondary': secondary,
    };
  }
}

/// Represents a team's match record for a season or in total.
class Record {
  /// Match statistics for the current season.
  final SeasonData season;

  /// Match statistics for the full history of the team.
  final SeasonData full;

  Record({
    required this.season,
    required this.full,
  });

  /// Creates a [Record] instance from a JSON [Map].
  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      season: SeasonData.fromJson(json['season']),
      full: SeasonData.fromJson(json['full']),
    );
  }

  /// Converts the [Record] instance to a JSON [Map].
  Map<String, dynamic> toJson() {
    return {
      'season': season.toJson(),
      'full': full.toJson(),
    };
  }
}

/// Represents the match statistics for a team in a given season or record.
class SeasonData {
  /// The number of wins achieved.
  final int wins;

  /// The number of losses.
  final int losses;

  /// The number of ties.
  final int ties;

  /// The total number of matches played.
  final int count;

  /// The win rate as a percentage.
  final double winrate;

  SeasonData({
    required this.wins,
    required this.losses,
    required this.ties,
    required this.count,
    required this.winrate,
  });

  /// Creates a [SeasonData] instance from a JSON [Map].
  factory SeasonData.fromJson(Map<String, dynamic> json) {
    return SeasonData(
      wins: tryCast(json['wins']) ?? 0,
      losses: tryCast(json['losses']) ?? 0,
      ties: tryCast(json['ties']) ?? 0,
      count: tryCast(json['count']) ?? 0,
      winrate: tryCast(json['winrate']) ?? 0.0,
    );
  }

  /// Converts the [SeasonData] instance to a JSON [Map].
  Map<String, dynamic> toJson() {
    return {
      'wins': wins,
      'losses': losses,
      'ties': ties,
      'count': count,
      'winrate': winrate,
    };
  }
}

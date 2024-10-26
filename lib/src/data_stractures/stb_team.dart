import 'package:statbotics/src/cast.dart';
import 'package:statbotics/src/data_stractures/stb_epa.dart';

class Team {
  String team;
  String name;
  String country;
  String? state;
  String district;
  int rookieYear;
  bool offseason;
  bool active;
  Colors colors;
  Record record;
  Epa normEpa;

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

class Colors {
  String? primary;
  String? secondary;

  Colors({
    this.primary,
    this.secondary,
  });

  factory Colors.fromJson(Map<String, dynamic> json) {
    return Colors(
      primary: tryCast(json['primary']),
      secondary: tryCast(json['secondary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary': primary,
      'secondary': secondary,
    };
  }
}

class Record {
  Season season;
  Season full;

  Record({
    required this.season,
    required this.full,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      season: Season.fromJson(json['season']),
      full: Season.fromJson(json['full']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': season.toJson(),
      'full': full.toJson(),
    };
  }
}

class Season {
  int wins;
  int losses;
  int ties;
  int count;
  double winrate;

  Season({
    required this.wins,
    required this.losses,
    required this.ties,
    required this.count,
    required this.winrate,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      wins: tryCast(json['wins']) ?? 0,
      losses: tryCast(json['losses']) ?? 0,
      ties: tryCast(json['ties']) ?? 0,
      count: tryCast(json['count']) ?? 0,
      winrate: tryCast(json['winrate']) ?? 0.0,
    );
  }

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

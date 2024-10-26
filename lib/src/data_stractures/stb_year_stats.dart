import 'package:statbotics/src/cast.dart';

class YearStats {
  final int year;
  final double scoreMean;
  final double scoreSd;
  final Map<String, Map<String, dynamic>> percentiles;
  final Map<String, dynamic> breakdown;
  final Metrics metrics;

  YearStats({
    required this.year,
    required this.scoreMean,
    required this.scoreSd,
    required this.percentiles,
    required this.breakdown,
    required this.metrics,
  });

  factory YearStats.fromJson(Map<String, dynamic> json) {
    return YearStats(
      year: tryCast(json['year']) ?? 0,
      scoreMean: tryCast(json['score_mean']) ?? 0.0,
      scoreSd: tryCast(json['score_sd']) ?? 0.0,
      percentiles: Map<String, Map<String, dynamic>>.from(json['percentiles']),
      breakdown: Map<String, dynamic>.from(json['breakdown']),
      metrics: Metrics.fromJson(json['metrics']),
    );
  }
}

class Metrics {
  final double fouls;
  final double penalties;
  final double averageSpeed;

  Metrics({
    required this.fouls,
    required this.penalties,
    required this.averageSpeed,
  });

  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      fouls: tryCast(json['fouls']) ?? 0.0,
      penalties: tryCast(json['penalties']) ?? 0.0,
      averageSpeed: tryCast(json['average_speed']) ?? 0.0,
    );
  }
}

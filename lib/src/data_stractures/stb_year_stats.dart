import 'package:statbotics/src/cast.dart';

/// Represents statistical data for a specific year.
class YearStats {
  /// The year of the statistics.
  final int year;

  /// The mean score for the year.
  final double scoreMean;

  /// The standard deviation of the scores for the year.
  final double scoreSd;

  /// A map of percentiles categorized by various metrics.
  final Map<String, Map<String, dynamic>> percentiles;

  /// A breakdown of various metrics for the year.
  final Map<String, dynamic> breakdown;

  /// Additional performance metrics for the year.
  final Metrics metrics;

  /// Constructs a [YearStats] instance with the specified properties.
  YearStats({
    required this.year,
    required this.scoreMean,
    required this.scoreSd,
    required this.percentiles,
    required this.breakdown,
    required this.metrics,
  });

  /// Creates a [YearStats] instance from a JSON [Map].
  ///
  /// Parses fields like `year`, `scoreMean`, and `scoreSd`, ensuring that
  /// all values are present and using [tryCast] for data integrity.
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

/// Represents specific performance metrics for a year.
class Metrics {
  /// The average number of fouls committed.
  final double fouls;

  /// The average penalties incurred.
  final double penalties;

  /// The average speed recorded.
  final double averageSpeed;

  /// Constructs a [Metrics] instance with specified properties.
  Metrics({
    required this.fouls,
    required this.penalties,
    required this.averageSpeed,
  });

  /// Creates a [Metrics] instance from a JSON [Map].
  ///
  /// Ensures values are extracted safely, using [tryCast] for data integrity.
  factory Metrics.fromJson(Map<String, dynamic> json) {
    return Metrics(
      fouls: tryCast(json['fouls']) ?? 0.0,
      penalties: tryCast(json['penalties']) ?? 0.0,
      averageSpeed: tryCast(json['average_speed']) ?? 0.0,
    );
  }
}

import 'package:statbotics/src/cast.dart';

/// A class representing EPA (Estimated Performance Average) statistics
/// for a team, which includes various metrics such as current, recent,
/// mean, and max values.
class Epa {
  /// The current EPA value for the team.
  final double current;

  /// The recent EPA value based on the team's recent performance.
  final double recent;

  /// The average EPA value calculated over a defined period.
  final double mean;

  /// The maximum EPA value achieved by the team.
  final double max;

  /// Constructs an [Epa] instance with the specified [current],
  /// [recent], [mean], and [max] values.
  Epa({
    required this.current,
    required this.recent,
    required this.mean,
    required this.max,
  });

  /// Creates an [Epa] instance from a JSON [Map].
  ///
  /// The [json] parameter should contain keys for 'current', 'recent',
  /// 'mean', and 'max'. If any key is missing, the respective field
  /// is set to `0.0` by default.
  factory Epa.fromJson(Map<String, dynamic> json) {
    return Epa(
      current: tryCast(json['current']) ?? 0.0,
      recent: tryCast(json['recent']) ?? 0.0,
      mean: tryCast(json['mean']) ?? 0.0,
      max: tryCast(json['max']) ?? 0.0,
    );
  }

  /// Converts the [Epa] instance to a JSON [Map].
  ///
  /// Returns a [Map] with keys 'current', 'recent', 'mean', and 'max',
  /// mapping to their respective values in the [Epa] instance.
  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'recent': recent,
      'mean': mean,
      'max': max,
    };
  }
}

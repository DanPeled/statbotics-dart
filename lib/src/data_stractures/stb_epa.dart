import 'package:statbotics/src/cast.dart';

class Epa {
  final double current;
  final double recent;
  final double mean;
  final double max;

  Epa({
    required this.current,
    required this.recent,
    required this.mean,
    required this.max,
  });

  factory Epa.fromJson(Map<String, dynamic> json) {
    return Epa(
      current: tryCast(json['current']) ?? 0.0, 
      recent: tryCast(json['recent']) ?? 0.0,   
      mean: tryCast(json['mean']) ?? 0.0,       
      max: tryCast(json['max']) ?? 0.0,         
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'recent': recent,
      'mean': mean,
      'max': max,
    };
  }
}

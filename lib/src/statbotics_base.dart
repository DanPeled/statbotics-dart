import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statbotics/statbotics.dart';

/// A class providing methods for interacting with the Statbotics API.
class Statbotics {
  /// The base URI for all Statbotics API requests.
  static final String baseUri = "https://api.statbotics.io/";

  /// General method for fetching data from a specific [path].
  ///
  /// This method sends a GET request to the specified [path] and
  /// decodes the response into a JSON [Map].
  ///
  /// Returns a [Future] containing the JSON-decoded response as a [Map].
  static Future<Map<String, dynamic>> getData(String path) async {
    Uri finalPath = Uri.parse("$baseUri/$path");
    var response = await http.get(finalPath);
    return jsonDecode(response.body);
  }

  /// Fetches data for a specific FRC team identified by [teamNumber].
  ///
  /// Returns a [Future] containing a [Team] object with data for the team.
  static Future<Team> getTeamData(int teamNumber) async {
    return Team.fromJson(await getData("v3/team/$teamNumber"));
  }

  /// Fetches yearly statistics for the specified [year].
  ///
  /// Returns a [Future] containing a [YearStats] object with statistics
  /// for the specified year.
  static Future<YearStats> getYearStatsData(int year) async {
    return YearStats.fromJson(await getData("v3/year/$year"));
  }

  /// Fetches data for a specific match identified by [matchId].
  ///
  /// Returns a [Future] containing a [Match] object with data for the match.
  static Future<Match> getMatchData(String matchId) async {
    return Match.fromJson(await getData("v3/match/$matchId"));
  }

  /// Fetches data for a specific event identified by [eventId].
  ///
  /// Returns a [Future] containing an [Event] object with data for the event.
  static Future<Event> getEventData(String eventId) async {
    return Event.fromJson(await getData("v3/event/$eventId"));
  }

  /// Fetches team statistics for a specific [teamNumber] and [year].
  ///
  /// Returns a [Future] containing a [TeamYearStats] object with
  /// statistics for the specified team and year.
  static Future<TeamYearStats> getTeamYearStats(
      int teamNumber, int year) async {
    return TeamYearStats.fromJson(
        await getData("v3/team_year/$teamNumber/$year"));
  }

  /// Fetches all matches associated with a specific event identified by [eventId].
  ///
  /// Returns a [Future] containing a [List] of [Match] objects for the event.
  static Future<List<Match>> getEventMatches(String eventId) async {
    final matchesJson = await getData("v3/event/$eventId/matches");
    return (matchesJson as List).map((match) => Match.fromJson(match)).toList();
  }

  /// Fetches all events held in a specific [year].
  ///
  /// Returns a [Future] containing a [List] of [Event] objects for the specified year.
  static Future<List<Event>> getYearEvents(int year) async {
    final eventsJson = await getData("v3/events/$year");
    return (eventsJson as List).map((event) => Event.fromJson(event)).toList();
  }
}

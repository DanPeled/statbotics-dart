import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statbotics/statbotics.dart';

class Statbotics {
  static final String baseUri = "https://api.statbotics.io/";

  // General method for fetching data
  static Future<Map<String, dynamic>> getData(String path) async {
    Uri finalPath = Uri.parse("$baseUri/$path");
    var response = await http.get(finalPath);
    return jsonDecode(response.body);
  }

  // Fetch team data
  static Future<Team> getTeamData(int teamNumber) async {
    return Team.fromJson(await getData("v3/team/$teamNumber"));
  }

  // Fetch yearly stats data
  static Future<YearStats> getYearStatsData(int year) async {
    return YearStats.fromJson(await getData("v3/year/$year"));
  }

  // Fetch match data by match ID
  static Future<Match> getMatchData(String matchId) async {
    return Match.fromJson(await getData("v3/match/$matchId"));
  }

  // Fetch event data by event ID
  static Future<Event> getEventData(String eventId) async {
    return Event.fromJson(await getData("v3/event/$eventId"));
  }

  // Fetch team stats for a specific year
  static Future<TeamYearStats> getTeamYearStats(
      int teamNumber, int year) async {
    return TeamYearStats.fromJson(
        await getData("v3/team_year/$teamNumber/$year"));
  }

  // Fetch matches for an event
  static Future<List<Match>> getEventMatches(String eventId) async {
    final matchesJson = await getData("v3/event/$eventId/matches");
    return (matchesJson as List).map((match) => Match.fromJson(match)).toList();
  }

  // Fetch events for a specific year
  static Future<List<Event>> getYearEvents(int year) async {
    final eventsJson = await getData("v3/events/$year");
    return (eventsJson as List).map((event) => Event.fromJson(event)).toList();
  }
}

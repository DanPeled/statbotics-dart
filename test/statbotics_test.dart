import 'package:statbotics/statbotics.dart';
import 'package:test/test.dart';

void main() {
  test('Get team data', () async {
    Team team = await Statbotics.getTeamData(9738);
    expect(team.name, "Ionic Bond");
  });

  test('Get year stats', () async {
    YearStats yearStats = await Statbotics.getYearStatsData(2024);
    expect(yearStats.year, 2024);
  });

  test('Get event data', () async {
    Event event = await Statbotics.getEventData('2024txhou');
    expect(event.name, "FIT District Houston Event");
  });

  test('Get match data', () async {
    Match match = await Statbotics.getMatchData("2024txhou_qm1");
    expect(match.redScore, isNonNegative);
    expect(match.blueScore, isNonNegative);
  });

  test('Get team year stats', () async {
    TeamYearStats teamYearStats = await Statbotics.getTeamYearStats(9738, 2024);
    expect(teamYearStats.wins, isNonNegative);
  });
}

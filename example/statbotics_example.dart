import 'package:statbotics/statbotics.dart';

void main() async {
  final teamData =
      await Statbotics.getTeamData(9738); // Fetch the data of team 9738
  print(teamData.name);
}

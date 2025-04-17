import 'package:hive/hive.dart';

part 'match_model.g.dart';

@HiveType(typeId: 0)
class MatchModel {
  @HiveField(0)
  final String teamUs;

  @HiveField(1)
  final String teamThem;

  @HiveField(2)
  final int scoreUs;

  @HiveField(3)
  final int scoreThem;

  @HiveField(4)
  final DateTime date;

  MatchModel({
    required this.teamUs,
    required this.teamThem,
    required this.scoreUs,
    required this.scoreThem,
    required this.date,
  });
}

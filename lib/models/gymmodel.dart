import 'package:hive/hive.dart';

part 'gymmodel.g.dart';

@HiveType(typeId: 0)
class GymModel extends HiveObject {
  @HiveField(0)
  final String muscaleName;
  @HiveField(1)
  final String date;
  @HiveField(2)
  List<ExercisesModel> exerciseList;
  @HiveField(3)
  final int id;

  GymModel(
    this.id, {
    required this.exerciseList,
    required this.muscaleName,
    required this.date,
  });
}

@HiveType(typeId: 1)
class ExercisesModel extends HiveObject {
  @HiveField(0)
  final String exerciseName;
  @HiveField(1)
  final List<ExerciseNumber> details;
  @HiveField(2)
  final int id;

  ExercisesModel(this.exerciseName, this.details, this.id);
}

@HiveType(typeId: 2)
class ExerciseNumber extends HiveObject {

  @HiveField(0)
  final int set;
  @HiveField(1)
  final int rep;
  @HiveField(2)
  final int kg;
   @HiveField(3)
  final int id;
  ExerciseNumber(this.set, this.rep, this.kg, this.id);
}

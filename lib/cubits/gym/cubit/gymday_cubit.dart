import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';


import '../../../models/gymmodel.dart';

part 'gymday_state.dart';

class GymdayCubit extends Cubit<GymdayState> {
  GymdayCubit() : super(GymdayInitial());
  List<GymModel>? gymdaycards;
  int? id;
  int? eid;
  List<ExercisesModel>? exercisecard;
  List<ExerciseNumber>? exerciseNumber;

  fetchallcard() {
    try {
      var gymbox = Hive.box<GymModel>('gymboxcard');
      gymdaycards = gymbox.values.toList();
      int lenght = gymdaycards!.length;
      id = gymdaycards![lenght - 1].key;
      print('id of the last card is $id');

      emit(GymdaySuccess());
    } catch (e) {
      print(e);
    }
  }

  fetchallexercisecard() {
    try {
      var exercisebox = Hive.box<ExercisesModel>('exercisemodelboxs');
      exercisecard = exercisebox.values.toList();
      
      int lenght = exercisecard!.length;
      eid = exercisecard![lenght - 1].key;
      emit(GymdayExerciseSuccess());
    } catch (e) {
      print(e);
    }
  }

  fetchallnumberdetails() {
    try {
  var numberbox = Hive.box<ExerciseNumber>('exercisenumberboxs');
  exerciseNumber = numberbox.values.toList();
}  catch (e) {
      print(e);

}
  }
}

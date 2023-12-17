import 'package:bloc/bloc.dart';
import 'package:gym_history/constants.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_gym_day_state.dart';

class AddGymDayCubit extends Cubit<AddGymDayState> {
  AddGymDayCubit() : super(AddGymDayInitial());
  int? lenght;
  addDay(GymModel model) async {
    emit(AddGymDayLoading());
    try {
      var gymbox = Hive.box<GymModel>(kGymbox);
      await gymbox.add(model);
      lenght = gymbox.length + 1;
      emit(AddGymDaySuccess());
    } catch (e) {
      emit(AddGymDayFailuer(e.toString()));
    }
  }

  addExercise(ExercisesModel model, GymModel card) async {
    emit(AddGymDayExerciseLoading());
    try {
      var exercisebox = Hive.box<ExercisesModel>('exercisemodelboxs');
      await exercisebox.add(model);
      emit(AddGymExerciseSuccess());
    } catch (e) {
      emit(AddGymExerciseFailuer(e.toString()));
    }
  }

  addExerciseDetails(ExerciseNumber model) async {
    emit(AddGymDayExerciseLoading());
    try {
      var numberbox = Hive.box<ExerciseNumber>('exercisenumberboxs');
      await numberbox.add(model);
      emit(AddGymExerciseNumberSuccess());
    } catch (e) {
      emit(AddGymExerciseFailuer(e.toString()));
    }
  }
}

part of 'add_gym_day_cubit.dart';

@immutable
sealed class AddGymDayState {}

final class AddGymDayInitial extends AddGymDayState {}

final class AddGymDayLoading extends AddGymDayState {}

final class AddGymDaySuccess extends AddGymDayState {}

final class AddGymDayFailuer extends AddGymDayState {
  final String message;

  AddGymDayFailuer(this.message);
}
final class AddGymDayExerciseLoading extends AddGymDayState {}

final class AddGymExerciseSuccess extends AddGymDayState {}
final class AddGymExerciseNumberSuccess extends AddGymDayState {}
final class AddGymExerciseFailuer extends AddGymDayState {
  final String message;

  AddGymExerciseFailuer(this.message);
}
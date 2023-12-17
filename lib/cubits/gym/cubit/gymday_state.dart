part of 'gymday_cubit.dart';

@immutable
sealed class GymdayState {}

final class GymdayInitial extends GymdayState {}
final class GymdaySuccess extends GymdayState {}
final class GymdayExerciseSuccess extends GymdayState {}
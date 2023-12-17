// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gymmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GymModelAdapter extends TypeAdapter<GymModel> {
  @override
  final int typeId = 0;

  @override
  GymModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GymModel(
      fields[3] as int,
      exerciseList: (fields[2] as List).cast<ExercisesModel>(),
      muscaleName: fields[0] as String,
      date: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GymModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.muscaleName)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.exerciseList)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GymModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExercisesModelAdapter extends TypeAdapter<ExercisesModel> {
  @override
  final int typeId = 1;

  @override
  ExercisesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExercisesModel(
      fields[0] as String,
      (fields[1] as List).cast<ExerciseNumber>(),
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExercisesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.exerciseName)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExercisesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExerciseNumberAdapter extends TypeAdapter<ExerciseNumber> {
  @override
  final int typeId = 2;

  @override
  ExerciseNumber read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseNumber(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseNumber obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.set)
      ..writeByte(1)
      ..write(obj.rep)
      ..writeByte(2)
      ..write(obj.kg)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseNumberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

import 'package:flutter/material.dart';
import 'package:gym_history/constants.dart';
import 'package:gym_history/cubits/cubit/add_gym_day_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/simpleblockobserver.dart';
import 'package:gym_history/views/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/gym/cubit/gymday_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GymModelAdapter());
  Hive.registerAdapter(ExercisesModelAdapter());
  Hive.registerAdapter(ExerciseNumberAdapter());

  await Hive.openBox<GymModel>('gymboxcard');
  await Hive.openBox<ExercisesModel>('exercisemodelboxs');
  await Hive.openBox<ExerciseNumber>('exercisenumberboxs');

  Bloc.observer = Simpleobserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddGymDayCubit(),
        ),
        BlocProvider(
          create: (context) => GymdayCubit(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      ),
    );
  }
}

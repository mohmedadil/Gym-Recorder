import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/gym/cubit/gymday_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/FloatingButton.dart';
import 'package:gym_history/widget/card.dart';
import 'package:gym_history/widget/exerciseslistview.dart';

class Workoutday extends StatefulWidget {
  const Workoutday({super.key, required this.card});
  final GymModel card;

  @override
  State<Workoutday> createState() => _WorkoutdayState();
}

class _WorkoutdayState extends State<Workoutday> {
  @override
  void initState() {
    BlocProvider.of<GymdayCubit>(context).fetchallexercisecard();
    BlocProvider.of<GymdayCubit>(context).fetchallnumberdetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: GymexercisesListView(
            card: widget.card,
          )),
          GymFloatingButtonExercise(card: widget.card),
        ],
      ),
    );
  }
}

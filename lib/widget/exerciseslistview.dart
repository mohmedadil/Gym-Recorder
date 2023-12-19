import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/gym/cubit/gymday_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/gymexercisedetails.dart';

class GymexercisesListView extends StatefulWidget {
  const GymexercisesListView({
    super.key,
    required this.card,
  });
  final GymModel card;

  @override
  State<GymexercisesListView> createState() => _GymexercisesListViewState();
}

class _GymexercisesListViewState extends State<GymexercisesListView> {
  List<ExercisesModel> myexercise = [];
  @override
  void initState() {
    BlocProvider.of<GymdayCubit>(context).fetchallexercisecard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymdayCubit, GymdayState>(
      builder: (context, state) {
        List<ExercisesModel> exercises =
            BlocProvider.of<GymdayCubit>(context).exercisecard ?? [];

        for (int i = 0; i < exercises.length; i++) {
          if (exercises[i].id == widget.card.id) {
            myexercise.add(exercises[i]);
          }
        }
        print('lenght of my exrercse ${myexercise.length}');
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: myexercise.length,
          itemBuilder: (context, index) {
            return GymExerciseDetails(exercise: myexercise[index]);
          },
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}

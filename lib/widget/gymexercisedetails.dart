import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/gym/cubit/gymday_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/shownumberdetails.dart';

class GymExerciseDetails extends StatefulWidget {
  final ExercisesModel exercise;
  const GymExerciseDetails({super.key, required this.exercise});

  @override
  State<GymExerciseDetails> createState() => _GymExerciseDetailsState();
}

class _GymExerciseDetailsState extends State<GymExerciseDetails> {
  List<ExerciseNumber> details = [];
  List<ExerciseNumber> mydetails = [];
  @override
  @override
  Widget build(BuildContext context) {
    details = widget.exercise.details;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 8),
                      child: Text(
                        widget.exercise.exerciseName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    subtitle: Container(
                      width: 100,
                      height: 100,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ShowNumberDetails(
                              exercise: details[index]);
                        },
                        itemCount: details.length,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        weight: 20,
                      ),
                      onPressed: () {
                        widget.exercise.delete();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

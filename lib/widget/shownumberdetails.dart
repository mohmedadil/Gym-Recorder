import 'package:flutter/material.dart';
import 'package:gym_history/models/gymmodel.dart';

class ShowNumberDetails extends StatelessWidget {
  final ExerciseNumber exercise;
  ShowNumberDetails({
    super.key,
    required this.exercise,
  });
  void Function(String?)? sets, rep, kg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('sets', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
                child: Text(
                  exercise.set.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black.withOpacity(0.3)),
          ),
          const Text(
            'reps',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
                child: Text(
                  exercise.rep.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black.withOpacity(0.3)),
          ),
          const Text(
            'kg',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
                child: Text(
                  exercise.kg.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}

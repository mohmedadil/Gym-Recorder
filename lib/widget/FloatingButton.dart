import 'package:flutter/material.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/addbottomsheet.dart';
import 'package:gym_history/widget/addbottomsheetform.dart';
import 'package:gym_history/widget/addexercisebottomsheet.dart';

class GymFloatingButton extends StatelessWidget {
  const GymFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return AddBottomSheetGym();
            });
      },
      child: const Icon(Icons.add),
    );
  }
}

class GymFloatingButtonExercise extends StatelessWidget {
  const GymFloatingButtonExercise({
    super.key, required this.card,
  });
  final GymModel card;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return AddBottomSheetGymExercise(card: card,);
            });
      },
      child: const Icon(Icons.add),
    );
  }
}

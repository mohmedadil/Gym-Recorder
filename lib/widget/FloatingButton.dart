import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/cubit/add_gym_day_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/addbottomsheet.dart';
import 'package:gym_history/widget/addexercisebottomsheet.dart';

import '../cubits/gym/cubit/gymday_cubit.dart';

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
    super.key,
    required this.card,
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
              return BlocConsumer<AddGymDayCubit, AddGymDayState>(
                listener: (context, state) {
                  if (state is AddGymExerciseSuccess) {
                    Navigator.pop(context);
                    BlocProvider.of<GymdayCubit>(context)
                        .fetchallexercisecard();
                  }
                },
                builder: (context, state) {
                  return AddBottomSheetGymExercise(
                    card: card,
                  );
                },
              );
            });
      },
      child: const Icon(Icons.add),
    );
  }
}

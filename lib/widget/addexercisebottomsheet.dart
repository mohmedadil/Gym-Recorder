import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/gym/cubit/gymday_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/ExerciseDetails.dart';
import 'package:gym_history/widget/customTextField.dart';
import 'package:gym_history/widget/custombutton.dart';

import '../cubits/cubit/add_gym_day_cubit.dart';

class AddBottomSheetGymExercise extends StatefulWidget {
  final GymModel card;

  const AddBottomSheetGymExercise({super.key, required this.card});
  @override
  State<AddBottomSheetGymExercise> createState() =>
      _AddBottomSheetGymExerciseState();
}

class _AddBottomSheetGymExerciseState extends State<AddBottomSheetGymExercise> {
  int? kg, rep, sets, eid;
  AutovalidateMode autovaldite = AutovalidateMode.disabled;
  final GlobalKey<FormState> key = GlobalKey();
  String? exercisename;
  List<ExerciseNumber> details = [];
  @override
  Widget build(BuildContext context) {
    eid = BlocProvider.of<GymdayCubit>(context).eid! + 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Custom_Text_Field(
                hint: 'Exercise Name',
                onsaved: (value) {
                  exercisename = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ExerciseDetails(
                kg: (value) {
                  kg = int.parse(value!);
                },
                rep: (value) {
                  rep = int.parse(value!);
                },
                sets: (value) {
                  sets = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Add More Rep',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(),
              BlocBuilder<AddGymDayCubit, AddGymDayState>(
                builder: (context, state) {
                  return CusttomButton(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        key.currentState!.save();
                        //set number of set rep kg
                        ExerciseNumber exerciseNumber =
                            ExerciseNumber(sets!, rep!, kg!, eid!);
                        BlocProvider.of<AddGymDayCubit>(context)
                            .addExerciseDetails(exerciseNumber);
                        details.add(exerciseNumber);
                        print('the set is'  '${details[0].set}');
                        //set exercise details
                        ExercisesModel exercisebox = ExercisesModel(
                            exercisename!, details, widget.card.id);

                        widget.card.exerciseList.add(exercisebox);
                        BlocProvider.of<AddGymDayCubit>(context)
                            .addExercise(exercisebox, widget.card);
                      } else {
                        autovaldite = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

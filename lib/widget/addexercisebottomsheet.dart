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
  int? eid;
  List<int> num = [];
  int counter = 1;
  AutovalidateMode autovaldite = AutovalidateMode.disabled;
  final GlobalKey<FormState> key = GlobalKey();
  String? exercisename;
  List<ExerciseNumber> details = [];
  @override
  Widget build(BuildContext context) {
    eid = BlocProvider.of<GymdayCubit>(context).eid! + 1;

    return Padding(
      padding: EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
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
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AddGymDayCubit, AddGymDayState>(
                builder: (context, state) {
                  if (counter == 1) {
                    return Column(
                      children: [
                        RowsOfRep(num: num, lenght: 1),
                        MaterialButton(
                          onPressed: () {
                            counter++;
                            setState(() {});
                          },
                          child: const Text(
                            'Add More Rep',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        RowsOfRep(
                          num: num,
                          lenght: counter,
                        ),
                        MaterialButton(
                          onPressed: () {
                            counter++;
                            setState(() {});
                          },
                          child: const Text(
                            'Add More Rep',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    );
                  }
                },
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
                        print('lenght of array= ${num.length}');
                        for (var element in num) {
                          print(element);
                        }
                        //set number of set rep kg
                        for (int i = 0; i < num.length; i=i+3) {
                          details.add(ExerciseNumber(
                              num[i], num[i + 1], num[i + 2], eid!)); //i=0
                                                                      //=3
                                                                      //=6
                                                                      //=9
                        }

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

class RowsOfRep extends StatelessWidget {
  int? kg, rep, sets;
  int lenght;
  List<int> num;
  RowsOfRep({this.lenght = 1, required this.num});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: lenght,
        itemBuilder: (context, index) {
          return ExerciseDetails(
            sets: (value) {
              num.add(int.parse(value!));
            },
            rep: (value) {
              num.add(int.parse(value!));
            },
            kg: (value) {
              num.add(int.parse(value!));
            },
          );
        },
      ),
    );
  }
}

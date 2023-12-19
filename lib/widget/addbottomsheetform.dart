import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/cubit/add_gym_day_cubit.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/customTextField.dart';
import 'package:gym_history/widget/custombutton.dart';
import 'package:intl/intl.dart';

import '../cubits/gym/cubit/gymday_cubit.dart';

class AddFormGym extends StatefulWidget {
  const AddFormGym({
    super.key,
  });

  @override
  State<AddFormGym> createState() => _AddFormGymState();
}

class _AddFormGymState extends State<AddFormGym> {
  AutovalidateMode autovaldite = AutovalidateMode.disabled;
  final GlobalKey<FormState> key = GlobalKey();
  int? id;
  String? muscalename, date;
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<GymdayCubit>(context).id! <= 0) {
      id = BlocProvider.of<GymdayCubit>(context).id! + 1;
    } else {
      id = 0;
    }
    return Form(
      key: key,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Custom_Text_Field(
            hint: 'Muscale Name',
            onsaved: (value) {
              muscalename = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddGymDayCubit, AddGymDayState>(
            builder: (context, state) {
              return CusttomButton(
                  isloading: state is AddGymDayLoading ? true : false,
                  onTap: () {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      var currentdate = DateTime.now();
                      var formattedDate =
                          DateFormat('dd-MM-yyyy').format(currentdate);
                      GymModel card = GymModel(
                        id!,
                        muscaleName: muscalename.toString(),
                        date: formattedDate,
                        exerciseList: [],
                      );
                      BlocProvider.of<AddGymDayCubit>(context).addDay(card);
                      print('id is $id');
                    } else {
                      autovaldite = AutovalidateMode.always;
                      setState(() {});
                    }
                  });
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

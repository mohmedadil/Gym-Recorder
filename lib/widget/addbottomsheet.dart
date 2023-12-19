import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/cubit/add_gym_day_cubit.dart';
import 'package:gym_history/widget/addbottomsheetform.dart';

import '../cubits/gym/cubit/gymday_cubit.dart';

class AddBottomSheetGym extends StatelessWidget {
  const AddBottomSheetGym({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: BlocConsumer<AddGymDayCubit, AddGymDayState>(
          listener: (context, state) {
            if (state is AddGymDaySuccess) {
              Navigator.pop(context);
              BlocProvider.of<GymdayCubit>(context).fetchallcard();
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is AddGymDayLoading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddFormGym(),
                ));
          },
        ),
      ),
    );
  }
}

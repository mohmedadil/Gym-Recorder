import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/widget/FloatingButton.dart';
import 'package:gym_history/widget/gymdaylistview.dart';

import '../cubits/gym/cubit/gymday_cubit.dart';

class GymDayViewBody extends StatefulWidget {
  const GymDayViewBody({
    super.key,
  });

  @override
  State<GymDayViewBody> createState() => _GymDayViewBodyState();
}

class _GymDayViewBodyState extends State<GymDayViewBody> {
  @override
  void initState() {
    BlocProvider.of<GymdayCubit>(context).fetchallcard();    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Expanded(child: GymDayListView()),
        GymFloatingButton(),
      ],
    );
  }
}

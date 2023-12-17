import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/cubits/gym/cubit/gymday_cubit.dart';
import 'package:gym_history/views/workoutday.dart';
import 'package:gym_history/widget/card.dart';

import '../models/gymmodel.dart';

class GymDayListView extends StatelessWidget {
  const GymDayListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymdayCubit, GymdayState>(
      builder: (context, state) {
        List<GymModel> gymdaycards =
            BlocProvider.of<GymdayCubit>(context).gymdaycards ?? [];

        return ListView.builder(
          itemCount: gymdaycards.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Workoutday(
                      card: gymdaycards[index],
                    );
                  }));
                },
                child: GymCard(
                  card: gymdaycards[index],
                ));
          },
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}

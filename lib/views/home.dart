import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_history/views/gymdayviewbody.dart';
import 'package:gym_history/views/workoutday.dart';
import 'package:gym_history/widget/FloatingButton.dart';
import 'package:gym_history/widget/card.dart';
import 'package:gym_history/widget/gymdaylistview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Workout History'),
        centerTitle: true,
      ),
      body: GymDayViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym_history/models/gymmodel.dart';
import 'package:gym_history/widget/customTextField.dart';

class ExerciseDetails extends StatelessWidget {
  ExerciseDetails({
    super.key,
    this.rep,
    this.kg,
    this.sets,
  });
  void Function(String?)? sets, rep, kg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('sets', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 40,
              height: 40,
              child: Custom_Text_Field_Rectangle(
                hint: '5',
                onsaved: sets,
              ),
            ),
          ),
          const Text(
            'reps',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
                width: 40,
                height: 40,
                child: Custom_Text_Field_Rectangle(
                  hint: '5',
                  onsaved: rep,
                )),
          ),
          const Text(
            'kg',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 40,
              height: 40,
              child: Custom_Text_Field_Rectangle(hint: '5', onsaved: kg),
            ),
          ),
        ],
      ),
    );
  }
}


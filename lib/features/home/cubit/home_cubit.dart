import 'dart:math';

import 'package:creativa3/features/home/cubit/home_states.dart';
import 'package:creativa3/features/result/models/bmi_result_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit()
      : super(
      HomeInitialState(genderName: "", height: 100, weight: 50, age: 20));

  void calculateBMI() {
    double bmi = state.weight / pow(state.height / 100, 2);
    String bmiString = bmi.toStringAsFixed(1);

    BmiResultModel result;

    if (bmi >= 25) {
      result = BmiResultModel(
        bmiNumber: bmiString,
        resultText: 'Overweight',
        interpretation:
        'You have a higher than normal body weight. Try to exercise more.',
      );
    } else if (bmi >= 18.5) {
      result = BmiResultModel(
        bmiNumber: bmiString,
        resultText: 'Normal',
        interpretation: 'You have a Normal Body Weight, Good Job.',
      );
    } else {
      result = BmiResultModel(
        bmiNumber: bmiString,
        resultText: 'Underweight',
        interpretation:
        'You have a lower than normal body weight. You can eat a bit more.',
      );
    }
    emit(
      HomeCalculateBmiState(
        genderName: state.genderName,
        height: state.height,
        weight: state.weight,
        age: state.age,
        bmiResult: result,
      ),
    );
  }

  void changeGender(String gender) {
    emit(
      HomeChangeGender(
        genderName: gender,
        height: state.height,
        weight: state.weight,
        age: state.age,
      ),
    );
  }

  void changeHeight(double height) {
    emit(
      HomeChangeHeightState(
        genderName: state.genderName,
        height: height,
        weight: state.weight,
        age: state.age,
      ),
    );
  }
}

import 'package:creativa3/features/result/models/bmi_result_model.dart';

abstract class HomeStates {
  final String genderName;
  final double height;
  final double weight;
  final int age;

  HomeStates({
    required this.genderName,
    required this.height,
    required this.weight,
    required this.age,
  });
}

class HomeInitialState extends HomeStates {
  HomeInitialState({
    required super.genderName,
    required super.height,
    required super.weight,
    required super.age,
  });
}

class HomeCalculateBmiState extends HomeStates {
  final BmiResultModel bmiResult;

  HomeCalculateBmiState({
    required super.genderName,
    required super.height,
    required super.weight,
    required super.age,
    required this.bmiResult,
  });
}

class HomeChangeGender extends HomeStates {
  HomeChangeGender({
    required super.genderName,
    required super.height,
    required super.weight,
    required super.age,
  });
}

class HomeChangeHeightState extends HomeStates {
  HomeChangeHeightState({
    required super.genderName,
    required super.height,
    required super.weight,
    required super.age,
  });
}

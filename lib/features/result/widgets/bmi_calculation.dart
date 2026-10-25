// // lib/core/utils/bmi_calculator.dart
//
// enum Gender { male, female }
//
// abstract class BMICalculator {
//   static Map<String, dynamic> calculate({
//     required double weightKg,
//     required double heightCm,
//     required int age,
//     required Gender gender,
//   }) {
//     if (weightKg <= 0 || heightCm <= 0 || age <= 0) {
//       throw ArgumentError('Weight, height, and age must be greater than zero.');
//     }
//
//     final double heightMeters = heightCm / 100;
//     final double bmi = double.parse((weightKg / (heightMeters * heightMeters)).toStringAsFixed(1));
//     final bool isMale = gender == Gender.male;
//
//     final double bodyFat = age >= 18
//         ? (1.20 * bmi) + (0.23 * age) - (isMale ? 16.2 : 5.4)
//         : (1.51 * bmi) - (0.70 * age) - (isMale ? 2.2 : -1.4);
//
//     final String category = bmi < 18.5
//         ? 'Underweight'
//         : bmi < 25.0
//         ? 'Normal weight'
//         : bmi < 30.0
//         ? 'Overweight'
//         : 'Obese';
//
//     return {
//       'bmi': bmi,
//       'bodyFat': double.parse(bodyFat.clamp(2.0, 60.0).toStringAsFixed(1)),
//       'category': category,
//     };
//   }
// }
class BMICalculator {
  final double weight; // بالكيلوجرام
  final double height; // بالسنتيمتر

  double _bmi = 0;

  BMICalculator({required this.weight, required this.height});

  // حساب المعادلة
  String calculateBMI() {
    _bmi = weight / ((height / 100) * (height / 100));
    return _bmi.toStringAsFixed(1); // تقريب لرقم عشري واحد
  }

  // تحديد العنوان
  String getResultText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // تحديد الرسالة النصية
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

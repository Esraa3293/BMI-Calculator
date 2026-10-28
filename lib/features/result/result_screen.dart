import 'package:creativa3/core/colors_manager.dart';
import 'package:creativa3/core/styles_manager.dart';
import 'package:creativa3/core/widgets/header.dart';
import 'package:creativa3/features/home/widgets/calculation.dart';
import 'package:creativa3/features/result/models/bmi_result_model.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var result = ModalRoute.of(context)?.settings.arguments as BmiResultModel;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Your Result", style: StylesManager.white40Bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.3,
                height: height * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(result.resultText, style: StylesManager.green20Bold),
                    Text(
                      result.bmiNumber,
                      style: StylesManager.white40Bold.copyWith(fontSize: 64),
                    ),
                    Text(
                      result.interpretation,
                      style: StylesManager.gray20W400.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Calculation(
        title: "Re - Calculate",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

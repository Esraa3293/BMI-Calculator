import 'package:creativa3/core/colors_manager.dart';
import 'package:creativa3/core/styles_manager.dart';
import 'package:creativa3/core/widgets/header.dart';
import 'package:creativa3/features/home/cubit/home_cubit.dart';
import 'package:creativa3/features/home/cubit/home_states.dart';
import 'package:creativa3/features/home/widgets/calculation.dart';
import 'package:creativa3/features/home/widgets/gender_item.dart';
import 'package:creativa3/features/home/widgets/gender_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeCalculateBmiState) {
          Navigator.pushNamed(context, "result", arguments: state.bmiResult);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: Header(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GenderItem(
                      icon: Icons.male,
                      title: "Male",
                      isSelected: state.genderName == "Male",
                      onTap: () {
                        context.read<HomeCubit>().changeGender("Male");
                      },
                    ),
                  ),
                  Expanded(
                    child: GenderItem(
                      icon: Icons.female,
                      title: "Female",
                      isSelected: state.genderName == "Female",
                      onTap: () {
                        context.read<HomeCubit>().changeGender("Female");
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                height: height * 0.3,
                margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height", style: StylesManager.gray20W300),
                    Text(
                      "${state.height.toInt()} cm",
                      style: StylesManager.white40Bold,
                    ),
                    Slider(
                      value: state.height,
                      min: 100,
                      max: 200,
                      onChanged: (value) {
                        context.read<HomeCubit>().changeHeight(value);
                      },
                      activeColor: ColorsManager.secColor,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GenderProperties(
                      weight: state.weight,
                      age: state.age,
                      isAged: false,
                    ),
                  ),
                  Expanded(
                    child: GenderProperties(
                      weight: state.weight,
                      age: state.age,
                      isAged: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: Calculation(
          title: "Calculate",
          onPressed: () {
            context.read<HomeCubit>().calculateBMI();
          },
        ),
      ),
    );
  }
}

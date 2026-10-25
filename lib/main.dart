import 'package:creativa3/features/home/cubit/home_cubit.dart';
import 'package:creativa3/features/home/home_screen.dart';
import 'package:creativa3/features/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (context) =>
            BlocProvider(create: (context) => HomeCubit(), child: HomeScreen()),
        "result": (context) => ResultScreen(),
      },
    );
  }
}

import 'package:creativa3/core/colors_manager.dart';
import 'package:creativa3/core/styles_manager.dart';
import 'package:flutter/material.dart';

class Calculation extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const Calculation({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.secColor,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(title, style: StylesManager.white32w600),
    );
  }
}

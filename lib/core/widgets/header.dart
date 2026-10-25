import 'package:creativa3/core/colors_manager.dart';
import 'package:creativa3/core/styles_manager.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("BMI Calculator", style: StylesManager.white20W600),
      centerTitle: true,
      elevation: 10,
      backgroundColor: ColorsManager.primaryColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

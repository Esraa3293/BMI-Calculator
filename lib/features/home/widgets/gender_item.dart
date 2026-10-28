import 'package:creativa3/core/colors_manager.dart';
import 'package:creativa3/core/styles_manager.dart';
import 'package:flutter/material.dart';

class GenderItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final void Function() onTap;

  const GenderItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.05,
        height: height * 0.21,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.secColor
              : Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 100),
            Text(title, style: StylesManager.gray20W400),
          ],
        ),
      ),
    );
  }
}

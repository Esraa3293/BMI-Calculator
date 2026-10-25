import 'package:creativa3/core/styles_manager.dart';
import 'package:flutter/material.dart';

class GenderProperties extends StatefulWidget {
  bool isAged;
  double weight;
  int age;

  GenderProperties({
    required this.weight,
    required this.age,
    required this.isAged,
    super.key,
  });

  @override
  State<GenderProperties> createState() => _GenderPropertiesState();
}

class _GenderPropertiesState extends State<GenderProperties> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 180,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.isAged ? "Age" : "Weight",
            style: StylesManager.gray20W300,
          ),
          Text(
            widget.isAged ? widget.age.toString() : widget.weight.toString(),
            style: StylesManager.white40Bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: CircleBorder()),
                onPressed: () {
                  widget.isAged ? widget.age-- : widget.weight--;
                  setState(() {});
                },
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: CircleBorder()),
                onPressed: () {
                  widget.isAged ? widget.age++ : widget.weight++;
                  setState(() {});
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

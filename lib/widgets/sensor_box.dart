import 'package:flutter/material.dart';

class SensorBox extends StatelessWidget {
  SensorBox({Key? key, required this.title, required this.onPress})
      : super(key: key);

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 140,
        width: 140,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              child: Text(title),
              onPressed: () => onPress(),
            ),
          ),
        ),
      ),
    );
  }
}
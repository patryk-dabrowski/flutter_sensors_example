import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class GyroscopePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GyroscopePage();
}

class _GyroscopePage extends State<GyroscopePage> {
  List<double>? _gyroscopeValues;

  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String>? gyroscope =
    _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final String? xValue = gyroscope?.elementAt(0);
    final String? yValue = gyroscope?.elementAt(1);
    final String? zValue = gyroscope?.elementAt(2);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gyroscope'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Gyroscope'),
          Text('x: $xValue, y: $yValue, z: $zValue'),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
  }
}

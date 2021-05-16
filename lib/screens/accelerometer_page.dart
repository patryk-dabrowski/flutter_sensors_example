import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class AccelerometerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccelerometerPage();
}

class _AccelerometerPage extends State<AccelerometerPage> {
  List<double>? _accelerometerValues;

  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String>? accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final String? xValue = accelerometer?.elementAt(0);
    final String? yValue = accelerometer?.elementAt(1);
    final String? zValue = accelerometer?.elementAt(2);

    return Scaffold(
      appBar: AppBar(
        title: Text('Accelerometer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Accelerometer: (in Gs where 1 G = 9.81 m s^-2)'),
            Text('x: $xValue, y: $yValue, z: $zValue'),
          ],
        ),
      ),
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
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
  }
}

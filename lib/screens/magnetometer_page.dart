import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:motion_sensors/motion_sensors.dart';

class MagnetometerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MagnetometerPage();
}

class _MagnetometerPage extends State<MagnetometerPage> {
  List<double> _magnetometerValues = [0.0, 0.0, 0.0];

  List<StreamSubscription> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  double calcDegree() {
    double angle = 0.0;
    double x = _magnetometerValues[0];
    double y = _magnetometerValues[1];

    if (atan2(y, x) >= 0) {
      angle = atan2(y, x) * (180 / pi);
    } else {
      angle = (atan2(y, x) + 2 * pi) * (180 / pi);
    }
    return angle - 90 >= 0 ? angle - 90 : angle + 271;
  }

  double calcRotate() {
    double x = _magnetometerValues[0];
    double y = _magnetometerValues[1];
    return pi / 2 - atan2(y, x) - pi / 2;
  }

  String calcDirection(double degree) {
    if (degree >= 22.5 && degree < 67.5) {
      return "NE";
    } else if (degree >= 67.5 && degree < 112.5) {
      return "E";
    } else if (degree >= 112.5 && degree < 157.5) {
      return "SE";
    } else if (degree >= 157.5 && degree < 202.5) {
      return "S";
    } else if (degree >= 202.5 && degree < 247.5) {
      return "SW";
    } else if (degree >= 247.5 && degree < 292.5) {
      return "W";
    } else if (degree >= 292.5 && degree < 337.5) {
      return "NW";
    } else {
      return "N";
    }
  }

  @override
  Widget build(BuildContext context) {
    final double rotate = calcRotate();
    final double degree = calcDegree();
    final String direction = calcDirection(degree);
    final String degreeFixed = degree.toStringAsFixed(1);

    print(rotate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Magnetometer'),
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset('assets/compass_pointer.png'),
          ),
          Center(
            child: Transform.rotate(
              angle: rotate,
              child: Image.asset('assets/compass_bg.png'),
            ),
          ),
          Center(
            child: Text('$degreeFixed'),
          ),
          Center(
            child: Text('$direction'),
          ),
        ],
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
        .add(motionSensors.magnetometer.listen((MagnetometerEvent event) {
      setState(() {
        _magnetometerValues = <double>[event.x, event.y, event.z];
      });
    }));
  }
}

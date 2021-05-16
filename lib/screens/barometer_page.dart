import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barometer/flutter_barometer.dart';

class BarometerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarometerPageState();
}

class _BarometerPageState extends State<BarometerPage> {
  List<double> _barometerValues = [0.0];

  List<StreamSubscription<dynamic>> _streamSubscriptions =
  <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer =
    _barometerValues.map((double v) => v.toStringAsFixed(1)).toList();
    final String pressure = accelerometer.elementAt(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Barometer'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Barometer'),
              Text('Pressure: $pressure'),
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
    _streamSubscriptions.add(flutterBarometerEvents.listen((FlutterBarometerEvent event) {
      setState(() {
        _barometerValues = <double>[event.pressure];
      });
    }));
  }
}
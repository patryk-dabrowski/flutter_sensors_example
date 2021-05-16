import 'package:flutter/material.dart';


class BarometerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarometerPageState();
}

class _BarometerPageState extends State<BarometerPage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barometer'),
      ),
      body: Center(
        child: Text('Running on: $_platformVersion\n'),
      ),
    );
  }
}
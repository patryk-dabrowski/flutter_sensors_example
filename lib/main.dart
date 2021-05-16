import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(SensorApp());
}

class SensorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SensorAppState();
}

class _SensorAppState extends State<SensorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey('HomePage'),
              child: HomePage(title: 'Sensors Example'),
            ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }
}

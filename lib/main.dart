import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  void _changePage(String pageName) {
    print(pageName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SensorBox(
                  title: 'Magnetometer',
                  onPress: () => _changePage('Magnetometer'),
                ),
                SensorBox(
                  title: 'Accelerometer',
                  onPress: () => _changePage('Accelerometer'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SensorBox(
                  title: 'Barometer',
                  onPress: () => _changePage('Barometer'),
                ),
                SensorBox(
                  title: 'Gyroscope',
                  onPress: () => _changePage('Gyroscope'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

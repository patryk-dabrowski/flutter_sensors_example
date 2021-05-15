import 'package:flutter/foundation.dart';
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

  void _changePage(BuildContext context, String pageName) {
    switch (pageName) {
      case 'Magnetometer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MagnetometerPage()),
        );
        break;
      case 'Accelerometer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccelerometerPage()),
        );
        break;
      case 'Barometer':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BarometerPage()),
        );
        break;
      case 'Gyroscope':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GyroscopePage()),
        );
        break;
      default:
        print(pageName);
    }
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
                  onPress: () => _changePage(context, 'Magnetometer'),
                ),
                SensorBox(
                  title: 'Accelerometer',
                  onPress: () => _changePage(context, 'Accelerometer'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SensorBox(
                  title: 'Barometer',
                  onPress: () => _changePage(context, 'Barometer'),
                ),
                SensorBox(
                  title: 'Gyroscope',
                  onPress: () => _changePage(context, 'Gyroscope'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MagnetometerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magnetometer'),
      ),
      body: Center(
        child: Text('Magnetometer'),
      ),
    );
  }
}

class AccelerometerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accelerometer'),
      ),
      body: Center(
        child: Text('Accelerometer'),
      ),
    );
  }
}

class BarometerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barometer'),
      ),
      body: Center(
        child: Text('Barometer'),
      ),
    );
  }
}

class GyroscopePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gyroscope'),
      ),
      body: Center(
        child: Text('Gyroscope'),
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

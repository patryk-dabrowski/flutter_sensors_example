import 'package:flutter/material.dart';
import '../widgets/sensor_box.dart';
import 'magnetometer_page.dart';
import 'accelerometer_page.dart';
import 'barometer_page.dart';
import 'gyroscope_page.dart';

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

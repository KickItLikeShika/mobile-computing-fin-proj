import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Proximity Sensor'),
      ),
      body: Center(
        child: ProximityWidget(),
      ),
    ),
  ));
}

class ProximityWidget extends StatefulWidget {
  
  @override
  _ProximityWidgetState createState() => _ProximityWidgetState();
}

class _ProximityWidgetState extends State<ProximityWidget> {
  bool _isObjectNearby = false;

  @override
  void initState() {
    super.initState();
    ProximitySensor.events.listen((int event) {
      setState(() {
        _isObjectNearby = (event == 1) ? true : false;
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _isObjectNearby ? Colors.green : Colors.red,
      ),
    );
  }
}

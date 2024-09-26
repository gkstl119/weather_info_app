import 'package:flutter/material.dart';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(), // Make sure this matches the class name below
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  // This is the class being referenced
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "City";
  String _temperature = "Temperature";
  String _weatherCondition = "Weather Condition";

  // Method to simulate fetching weather data
  void _fetchWeatherData() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = "25°C"; // Simulated temperature
      _weatherCondition = "Sunny"; // Simulated weather condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField for City Input
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Fetch Weather Button
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),

            // Display Weather Information
            Text(
              _cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _temperature,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 10),
            Text(
              _weatherCondition,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

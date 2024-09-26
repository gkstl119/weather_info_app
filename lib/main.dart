import 'dart:math'; // Import to generate random numbers
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
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "City";
  String _temperature = "Temperature";
  String _weatherCondition = "Weather Condition";

  // Function to simulate fetching weather data
  void _fetchWeatherData() {
    String enteredCity = _cityController.text;
    if (enteredCity.isEmpty) {
      // If no city is entered, show a warning
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a city name!'),
        ),
      );
      return;
    }

    // Generate random temperature between 15°C and 30°C
    int randomTemperature = 15 + Random().nextInt(16); // 15 to 30

    // Randomly select a weather condition
    List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
    String randomCondition =
        weatherConditions[Random().nextInt(weatherConditions.length)];

    // Update the state with the new weather data
    setState(() {
      _cityName = enteredCity;
      _temperature = "$randomTemperature°C";
      _weatherCondition = randomCondition;
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

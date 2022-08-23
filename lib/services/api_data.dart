import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/cities.dart';

class ApiData {


  /// Get location data from our openweather API service.
  Future<Cities> getLocationDataFromApi() async {
    final locationData = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${Cities.instance.location}&appid=${Cities.apiKey}'),
    );

    if (locationData.statusCode == 200) {
      return Cities.fromJson(
        jsonDecode(
          locationData.body,
        ),
      );
    }
    else {
      throw Exception('Failed to load data');
    }
  }
}

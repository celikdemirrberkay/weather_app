import 'package:weather_app/views/search_page_view.dart';

class Cities {

  ///Instance
  String? location = "Ankara" ;
  double? temp;
  String? weatherType;


  static const String apiKey = 'APIKEY';

  Cities({ this.location,this.temp,this.weatherType});

  ///Singleton
  static final Cities instance = Cities._();
  Cities._();

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(

      location: json["name"],
      temp: json["main"]["temp"],
      weatherType: json["weather"][0]["main"],
    );
  }




}

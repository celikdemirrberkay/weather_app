import 'package:weather_app/views/search_page_view.dart';

class Cities {

  String? location = "Kocaeli" ;
  double? temp;
  static const String apiKey = '82a901440a625f76298f02a43e1ba910';

  Cities({ this.location,this.temp});

  ///Singleton
  static final Cities instance = Cities._();
  Cities._();

  ///
  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      location: json['name'],
      temp: json['main']['temp'],
    );
  }




}
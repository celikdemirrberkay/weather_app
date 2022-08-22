class Cities {

  String location;
  double temp;
  static const String apiKey = '82a901440a625f76298f02a43e1ba910';

  Cities({ this.location="Ankara",this.temp=20.0});


  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      location: json['name'],
      temp: json['main']['temp'],
    );
  }




}
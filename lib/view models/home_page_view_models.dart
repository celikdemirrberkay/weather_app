import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/services/api_data.dart';

import '../views/search_page_view.dart';

class HomePageViewModels extends ChangeNotifier {

  /// Singleton
  static final HomePageViewModels _singleton = HomePageViewModels._internal();
  factory HomePageViewModels() {
    return _singleton;
  }
  HomePageViewModels._internal();
  /// Objeler
  Cities _cities = Cities();
  ApiData _apiData = ApiData();


  /// Gelen şehri döndürüyoruz.
   getCityInfo() {
     HomePageViewModels h = HomePageViewModels();
     return  _apiData.locationDataParsed;
  }



  /// Navigatorla Search Page'e geçecek
   void goToSearchPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPageView()));
  }










}

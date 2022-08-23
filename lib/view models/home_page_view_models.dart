import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/services/api_data.dart';

import '../views/search_page_view.dart';

class HomePageViewModels extends ChangeNotifier {

  HomePageViewModels();

  /// Singleton
  static final HomePageViewModels instance = HomePageViewModels._();
  HomePageViewModels._();

  /// Objeler
  Cities _cities = Cities();
  ApiData _apiData = ApiData();


  /// Gelen şehri döndürüyoruz.
   Future<Cities> getCityInfo() async{
     return  await _apiData.getLocationDataFromApi();
  }




  /// Navigatorla Search Page'e geçecek
   void goToSearchPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPageView()));
  }










}

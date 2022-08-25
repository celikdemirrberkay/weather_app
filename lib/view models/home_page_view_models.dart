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
  //Cities _cities = Cities();
  ApiData _apiData = ApiData();
  var selectedCity;

  /// Gelen şehri döndürüyoruz.
   Future<Cities> getCityInfo() async{
     return  await _apiData.getLocationDataFromApi();
  }



  /// Navigatorla Search Page'e geçecek
   void goToSearchPage(BuildContext context) async{
     selectedCity = await Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPageView()));
    if(selectedCity == null ){
      selectedCity = "Ankara";
    }
    else{
      Cities.instance.location = selectedCity;
    }
    notifyListeners();
  }

  void refreshErrorPage(){
    Cities.instance.location = "Ankara";
    notifyListeners();
  }








}

import 'package:flutter/material.dart';
import 'package:weather_app/views/search_page_view.dart';

import '../models/cities.dart';
import 'home_page_view_models.dart';

class SearchPageViewModels extends ChangeNotifier{


  /// Navigator go to home page
  void goToHomePage(BuildContext context , var data){
    Navigator.pop(context,data);
  }

  /// Update home page status for new city
  void updateHomeScreenStatus() async{
    HomePageViewModels.instance.selectedCity = Cities.instance.location;
    await HomePageViewModels.instance.getCityInfo();
    print((Cities.instance.location));
  }









}
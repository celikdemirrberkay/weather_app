import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view%20models/home_page_view_models.dart';
import 'package:weather_app/view%20models/search_page_view_models.dart';

class SearchPageView extends StatefulWidget {
  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageViewModels>(
      create: (_) => SearchPageViewModels(),
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/search.jpg'),
          ),
        ),
        child: Scaffold(
          floatingActionButton: Container(
            height: 70,
            width: 70,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<SearchPageViewModels>(context, listen: false)
                      .goToHomePage(context,selectedCity);
                  Provider.of<SearchPageViewModels>(context,listen: false).updateHomeScreenStatus();
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.brown[900],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (value){
                        selectedCity = value;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search city",
                        hintStyle: TextStyle(
                          color: Colors.white38,
                          fontSize: 30,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

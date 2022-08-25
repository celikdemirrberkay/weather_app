import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view%20models/home_page_view_models.dart';
import 'package:weather_app/views/styles/font_style.dart';
import '../models/cities.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    HomePageViewModels.instance.getCityInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModels>(
      create: (_) => HomePageViewModels(),
      builder: (context, child) => FutureBuilder<Cities>(
          future: Provider.of<HomePageViewModels>(context).getCityInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/search.jpg'),
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Something went wrong !",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 30,),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<HomePageViewModels>(context,listen: false).refreshErrorPage();
                            Provider.of<HomePageViewModels>(context,listen: false).goToSearchPage(context);
                          },
                          child: Icon(Icons.refresh,size: 30),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.brown,padding: EdgeInsets.symmetric(vertical: 5,horizontal: 40)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('assets/${snapshot.data!.weatherType}.jpg'),
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${snapshot.data!.temp?.toInt()}°C",
                            style:
                                myTextStyle(color: Colors.white, fontSize: 80),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${snapshot.data!.location}",
                                style: myTextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<HomePageViewModels>(
                                    context,
                                    listen: false,
                                  ).goToSearchPage(context);
                                },
                                icon: Icon(
                                  color: Colors.white,
                                  Icons.search,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }
          }),
    );
  }
}

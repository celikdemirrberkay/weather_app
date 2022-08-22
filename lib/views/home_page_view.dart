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
    super.initState();
    HomePageViewModels h = HomePageViewModels();
    h.getCityInfo();
  }

  @override
  Widget build(BuildContext context) {
    HomePageViewModels h = HomePageViewModels();

    return ChangeNotifierProvider<HomePageViewModels>(
      create: (_) => HomePageViewModels(),
      builder: (context, child) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/c.jpg'),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: FutureBuilder<Cities>(
                future: h.getCityInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong ! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data!.temp}",
                          style: myTextStyle(color: Colors.white, fontSize: 80),
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
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
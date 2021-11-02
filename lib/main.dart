import 'package:covid_19_flutter/screen/covidToday.dart';
import 'package:covid_19_flutter/screen/covidTodayByProvinces.dart';
import 'package:covid_19_flutter/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Thailand',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/CovidToday': (context) => CovidTodayScreen(),
        '/CovidByProvince' : (context) => CovidTodayByProvincesScreen(),
      },
      initialRoute: "/",
      // home: HomeScreen(),
    );
  }
}

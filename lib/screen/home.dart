import 'package:covid_19_flutter/screen/covidToday.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> page = [CovidTodayScreen()];
  int indexPage = 0;

  

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: s.height,
        width: s.width,
        child: page.elementAt(indexPage)
      ),
    );
  }
}
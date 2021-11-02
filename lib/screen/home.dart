import 'package:covid_19_flutter/other/about.dart';
import 'package:covid_19_flutter/screen/covidToday.dart';
import 'package:covid_19_flutter/screen/covidTodayByProvinces.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> page = [CovidTodayScreen(), CovidTodayByProvincesScreen()];
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid 19 Thailand"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Text("Head")
            ),
            ListTile(
              onTap: (){
                setState(() {
                  indexPage = 0;                
                });
                Navigator.pop(context);
              },
              title: Text("Covid Today"),
            ),
            ListTile(
              onTap: (){
                setState(() {
                  indexPage = 1;                
                });
                Navigator.pop(context);
              },
              title: Text("Covid Today by Provinces"),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: (){
                
                Navigator.pop(context);
                showDialog(
                  context: context, 
                  builder: (context) => AboutProject(),
                );
              },
              title: Text("About this project"),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: s.height,
            width: s.width,
            child: page.elementAt(indexPage)
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextButton(
                onPressed: (){
                  html.window.open("https://covid19.ddc.moph.go.th/", "");
                },
                child: Text("source: DDC open data"),
              ),
            )
          )
        ],
      ),
    );
  }
}
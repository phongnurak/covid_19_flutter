import 'package:covid_19_flutter/model/md_covidToday.dart';
import 'package:covid_19_flutter/service/covid19.dart';
import 'package:flutter/material.dart';

class CovidTodayScreen extends StatefulWidget {
  const CovidTodayScreen({ Key key }) : super(key: key);

  @override
  _CovidTodayScreenState createState() => _CovidTodayScreenState();
}

class _CovidTodayScreenState extends State<CovidTodayScreen> {
  ICovidToday iCovidToday = ICovidToday();

  void getData() async {
    iCovidToday = await CovidService().getCovidToday();
    // print(iCovidToday);
    setState(() {});
  }

  @override
    void initState() {
      getData();
      super.initState();
    }
    
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: s.height * 0.8,
        width: s.width * 0.8,
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: s.height * 0.2,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Date: ${iCovidToday.date}",
                    style: TextStyle(
                      fontSize: (s.height * 0.01) + (s.width * 0.01),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: s.height * 0.15,
                    child: Text(
                      "New case: ${iCovidToday.newCase}"
                    ),
                  ),
                  Container(
                    height: s.height * 0.15,
                    child: Text("Total case: ${iCovidToday.totalCase}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: s.height * 0.15,
                    child: Text("New death: ${iCovidToday.newDeath}"),
                  ),
                  Container(
                    height: s.height * 0.15,
                    child: Text("Total death: ${iCovidToday.totalCase}"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: s.height * 0.15,
                    child: Text("New recovered: ${iCovidToday.newRecovered}"),
                  ),
                  Container(
                    height: s.height * 0.15,
                    child: Text("Total recovered: ${iCovidToday.totolRecovered}"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
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
                    "Update : ${iCovidToday.updateDate}",
                    style: TextStyle(
                      fontSize: (s.height * 0.02) + (s.width * 0.01),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              //new case 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    color: Colors.red,
                    height: s.height * 0.3,
                    width: s.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "New Case: ${iCovidToday.newCase}".toString()
                          // .replaceAllMapped(from, (match) => null)
                          ,style: TextStyle(
                            
                          ),
                        ),
                        SizedBox(height: s.height * 0.05,),
                        Text("Total Case: ${iCovidToday.totalCase}"),
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    color: Colors.red,
                    height: s.height * 0.3,
                    width: s.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("New Death: ${iCovidToday.newDeath}"),
                        SizedBox(height: s.height * 0.05,),
                        Text("Total Death: ${iCovidToday.totalDeath}"),
                      ],
                    )
                  ),
                 
                ],
              ),
              SizedBox(height: 10,),
              

              //recovery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    color: Colors.red,
                    height: s.height * 0.2,
                    width: s.width * 0.3,
                    child: Column(
                      children: [],
                    )
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
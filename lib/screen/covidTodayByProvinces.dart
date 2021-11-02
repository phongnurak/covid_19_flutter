import 'package:covid_19_flutter/model/md_covidTodayByprovinces.dart';
import 'package:covid_19_flutter/service/covid19.dart';
import 'package:flutter/material.dart';

class CovidTodayByProvincesScreen extends StatefulWidget {
  const CovidTodayByProvincesScreen({ Key key }) : super(key: key);

  @override
  _CovidTodayByProvincesScreenState createState() => _CovidTodayByProvincesScreenState();
}

class _CovidTodayByProvincesScreenState extends State<CovidTodayByProvincesScreen> {
  List<ICovidTodayByProvinces> covidByProvinces = [];
  String curDate = DateTime.now().toIso8601String().split("T")[0];
  
  void getData() async {
    covidByProvinces = await CovidService().getCovidTodayByProvinces();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: s.height * 0.2,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Date: $curDate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ),

              Expanded(
                child: Container(
                  // height: s.height ,
                  // width: s.width,
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 2,
                      headingRowColor: MaterialStateProperty.all<Color>(Color(0xFF68378B)),
                      headingTextStyle: TextStyle(
                        fontSize: 15
                      ),
                      columns: [
                        DataColumn(label: Text(
                          "Province",
                          style: TextStyle(
                            fontSize: 15
                          )
                        )),
                        DataColumn(label: Text(
                          "New case",
                          style: TextStyle(
                            fontSize: 15
                          )
                        )),
                        DataColumn(label: Text(
                          "New Death",
                          style: TextStyle(
                            fontSize: 15
                          )
                        )),
                        
                      ],
                      rows: [

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
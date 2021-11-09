import 'package:covid_19_flutter/model/md_covidTodayByprovinces.dart';
import 'package:covid_19_flutter/model/md_province.dart';
import 'package:covid_19_flutter/service/covid19.dart';
import 'package:covid_19_flutter/service/thailandAddress.dart';
import 'package:flutter/material.dart';

class CovidTodayByProvincesScreen extends StatefulWidget {
  const CovidTodayByProvincesScreen({ Key key }) : super(key: key);

  @override
  _CovidTodayByProvincesScreenState createState() => _CovidTodayByProvincesScreenState();
}

class _CovidTodayByProvincesScreenState extends State<CovidTodayByProvincesScreen> {
  List<ICovidTodayByProvinces> covidByProvinces = [];
  String curDate = DateTime.now().toIso8601String().split("T")[0];
  String provinceSelected;
  ICovidTodayByProvinces provinceData;
  List<IProvince> provinces = [];
  
  void getData() async {
    covidByProvinces = await CovidService().getCovidTodayAllProvinces();

  }

  void getProvince() async {
    provinces = await ThailandAddressService().getProvince();
    if (mounted) {
      setState((){});
    }
  }

  void filterProvinceData(String province){
    covidByProvinces.forEach((element) { 
      if (element.province == province) {
        if (mounted) {
          setState(() {
            provinceData = element;
          });
        }
      }
    });
  }

  @override
    void initState() {
      getData();
      getProvince();
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

              DropdownButton(
                hint: Text("Select Province"),
                value: provinceSelected,
                onChanged: (province){
                  print(province);
                  filterProvinceData(province);
                  setState(() {
                    provinceSelected = province;
                  });
                },
                items: provinces.map((p){
                  return DropdownMenuItem(
                    child: Text("${p.name}"),
                    value: p.name,
                  );
                }).toList(),
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
                          "New case",
                          style: TextStyle(
                            fontSize: 15
                          )
                        )),
                        DataColumn(label: Text(
                          "Total case",
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
                        DataColumn(label: Text(
                          "Total Death",
                          style: TextStyle(
                            fontSize: 15
                          )
                        )),
                        
                      ],
                      rows: [
                        DataRow(
                          cells:
                          provinceData != null ? <DataCell>[
                            DataCell(Text('${provinceData.newCase}')),
                            DataCell(Text('${provinceData.totalCase}')),
                            DataCell(Text('${provinceData.newDeath}')),
                            DataCell(Text('${provinceData.totalDeath}')),
                          ] : 
                          [
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                            DataCell(Text('0')),
                          ]
                        )
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
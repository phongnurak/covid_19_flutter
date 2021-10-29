import 'dart:convert';

import 'package:covid_19_flutter/model/md_covidToday.dart';
import 'package:http/http.dart' as http;

class CovidService{

  Future<ICovidToday> getCovidToday() async {
    http.Response res = await http.get(Uri.parse("https://covid19.ddc.moph.go.th/api/Cases/today-cases-all"));
  
    if (res.statusCode == 200) {
      // ICovidToday covidTodayObj = ICovidToday();
      // covidTodayObj = jsonDecode(res.body);
      return ICovidToday.fromJson(jsonDecode(res.body)[0]);
    }
    return null;
  }




}
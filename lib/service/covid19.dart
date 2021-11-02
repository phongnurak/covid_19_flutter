import 'dart:convert';

import 'package:covid_19_flutter/model/md_covidToday.dart';
import 'package:covid_19_flutter/model/md_covidTodayByprovinces.dart';
import 'package:http/http.dart' as http;

class CovidService{

  Future<ICovidToday> getCovidToday() async {
    http.Response res = await http.get(Uri.parse("https://covid19.ddc.moph.go.th/api/Cases/today-cases-all"));
  
    if (res.statusCode == 200) {
      return ICovidToday.fromJson(jsonDecode(res.body)[0]);
    }
    return null;
  }

  Future<List<ICovidTodayByProvinces>> getCovidTodayByProvinces() async {
    http.Response res = await http.get(Uri.parse("https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => ICovidTodayByProvinces.formJson(e)).toList();
    }
    return [];
  }


}
import 'dart:convert';

import 'package:covid_19_flutter/model/md_province.dart';
import 'package:http/http.dart' as http;

class ThailandAddressService{

  Future<List<IProvince>> getProvince() async {
    http.Response res = await http.get(Uri.parse("https://thaiaddressapi-thaikub.herokuapp.com/v1/thailand/provinces"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)["data"];
      List<IProvince> province = body.map((json)=> IProvince.formJson(json)).toList();
      
      return province;
      
    }
    return null;
  }
}
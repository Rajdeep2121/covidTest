// import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class IndiaCases {
  String totalCases;
  String activeCases;
  String deathCases;
  String recoveredCases;

  IndiaCases(
      {this.totalCases,
      this.activeCases,
      this.deathCases,
      this.recoveredCases});

  Future<void> getCases() async {
    Response response = await get('https://api.covid19india.org/data.json');
    Map data = jsonDecode(response.body);

    // print(data['statewise'][0]);
    String totalCasesim = data['statewise'][0]['confirmed'].toString();
    String activeCasesim = data['statewise'][0]['active'].toString();
    String deathCasesim = data['statewise'][0]['deaths'].toString();
    String recoveredCasesim = data['statewise'][0]['recovered'].toString();

    totalCases = totalCasesim;
    activeCases = activeCasesim;
    deathCases = deathCasesim;
    recoveredCases = recoveredCasesim;
  }
}

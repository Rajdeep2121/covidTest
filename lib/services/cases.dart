// import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class IndiaCases {
  String totalCases;
  String activeCases;
  String deathCases;
  String recoveredCases;

  String delTotal;
  String delRecd;
  String delDeath;

  IndiaCases({
    this.totalCases,
    this.activeCases,
    this.deathCases,
    this.recoveredCases,
    this.delTotal,
    this.delRecd,
    this.delDeath,
  });

  Future<void> getCases() async {
    Response response = await get('https://api.covid19india.org/data.json');
    Map data = jsonDecode(response.body);

    // print(data['statewise'][0]);
    String totalCasesim = data['statewise'][0]['confirmed'].toString();
    String activeCasesim = data['statewise'][0]['active'].toString();
    String deathCasesim = data['statewise'][0]['deaths'].toString();
    String recoveredCasesim = data['statewise'][0]['recovered'].toString();
    String delTotalim = data['statewise'][0]['deltaconfirmed'].toString();
    String delRecdim = data['statewise'][0]['deltarecovered'].toString();
    String delDeathim = data['statewise'][0]['deltadeaths'].toString();
    print(totalCasesim[0]);

    totalCases = totalCasesim;
    activeCases = activeCasesim;
    deathCases = deathCasesim;
    recoveredCases = recoveredCasesim;
    delTotal = delTotalim;
    delRecd = delRecdim;
    delDeath = delDeathim;
  }
}

import 'package:flutter/material.dart';
import 'package:covid19ethio/model/cases.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:covid19ethio/commonData.dart';

class Data {
  fetchCases() async {
    try {
      var dataFromURL =
          await http.get("https://api.pmo.gov.et/v1/cases/?format=json");
      var jsonData = json.decode(dataFromURL.body);
      if (jsonData != null)
        latestCases = Cases(jsonData[0]['total'], jsonData[0]['stable'],
            jsonData[0]['critical'], jsonData[0]['deceased']);
      print(latestCases.total);
      //latestCases.total = jsonData[0]['total'];
    } catch (e) {}
  }
}

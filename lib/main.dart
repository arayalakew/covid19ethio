import 'package:flutter/material.dart';
import 'screen/home.dart';
import 'screen/report.dart';
import 'package:covid19ethio/res/colors.dart';
import 'commonData.dart';
import 'model/chart_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    await data.fetchCases();

    charts.clear();
    charts
        .add(ChartModel(latestCases.critical, "Critical", ColorsRes.confirmed));
    charts
        .add(ChartModel(latestCases.stable, "Recovered", ColorsRes.recovered));
    charts.add(ChartModel(latestCases.deceased, "Deaths", ColorsRes.deaths));

    totalReport = latestCases.total;
    setState(() {
      dataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(ColorsRes.colorPrimary),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Dashboard(),
        '/report': (BuildContext context) => ReportCase(),
      },
      //initialRoute: '/loader',
    );
  }
}

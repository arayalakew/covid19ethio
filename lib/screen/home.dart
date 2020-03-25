import 'package:flutter/material.dart';
import 'package:covid19ethio/data/data.dart';
import 'package:covid19ethio/commonData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19ethio/res/colors.dart';
import 'package:covid19ethio/model/chart_model.dart';
import 'package:covid19ethio/widget/nav_drawer.dart';
import 'package:covid19ethio/screen/view/stats.dart';
import 'package:covid19ethio/widget/bottom_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 360, height: 640, allowFontScaling: true)
          ..init(context);

    return Scaffold(
        //backgroundColor: ColorScheme.dark(),
        backgroundColor: Color(ColorsRes.colorAccent),
        drawer: NavDrawer(),
        //bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          centerTitle: false,
          title: Text('COVID19 ETHIOPIA'),
          elevation: 6.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              (dataLoaded == true)
                  ? Statistics(
                      charts: charts, totalReport: totalReport, data: data)
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: SpinKitFadingCircle(
                        color: Colors.blueGrey,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Text(
                  'የበሽታውን ምልክት በራስዎ ወይም በሌላ ሰው ላይ ካዩ እዚህ ጋር ያሳውቁ',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              Container(
                width: 300,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print('');
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      'እዚህ ያሳውቁ / Report Incident',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/report');
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      'እርዳታ እፈልጋለሁ / I need help',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

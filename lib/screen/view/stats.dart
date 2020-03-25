import 'package:flutter/material.dart';
import 'package:covid19ethio/data/data.dart';
import 'package:covid19ethio/commonData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19ethio/res/colors.dart';
import 'package:covid19ethio/res/strings.dart';
import 'package:covid19ethio/widget/gauge_chart.dart';
import 'package:covid19ethio/model/chart_model.dart';
import 'package:covid19ethio/helper/global_helper.dart';

class Statistics extends StatelessWidget {
  const Statistics({
    Key key,
    @required this.charts,
    @required this.totalReport,
    @required this.data,
  }) : super(key: key);

  final List<ChartModel> charts;
  final int totalReport;
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Card(
        color: Color(ColorsRes.colorAccent),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(200),
                    child: Stack(
                      children: <Widget>[
                        GaugeChart.setdata(charts),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                GlobalHelper().numberFormat(totalReport),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(16),
                                    fontFamily: "SansRegular"),
                              ),
                              Text(
                                "የተረጋገጠ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil().setSp(12),
                                    fontFamily: "SansRegular"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Text(
                                    data != null
                                        ? GlobalHelper()
                                            .numberFormat(latestCases.critical)
                                        : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(16),
                                        fontFamily: "SansRegular")),
                                Text(Strings.critical,
                                    style: TextStyle(
                                        color: Color(ColorsRes.confirmed),
                                        fontSize: ScreenUtil().setSp(12),
                                        fontFamily: "SansBold")),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Container(
                          width: 100,
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Text(
                                    data != null
                                        ? GlobalHelper()
                                            .numberFormat(latestCases.stable)
                                        : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(16),
                                        fontFamily: "SansRegular")),
                                Text(Strings.recovered,
                                    style: TextStyle(
                                        color: Color(ColorsRes.recovered),
                                        fontSize: ScreenUtil().setSp(12),
                                        fontFamily: "SansBold"))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Container(
                          width: 100,
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Text(
                                    data != null
                                        ? GlobalHelper()
                                            .numberFormat(latestCases.deceased)
                                        : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(16),
                                        fontFamily: "SansRegular")),
                                Text(Strings.deaths,
                                    style: TextStyle(
                                        color: Color(ColorsRes.deaths),
                                        fontSize: ScreenUtil().setSp(12),
                                        fontFamily: "SansBold")),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                Strings.desc_statistic,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SansRegular",
                    fontSize: ScreenUtil().setSp(12)),
              ),
              Text(
                Strings.desc_statistic_2,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SansRegular",
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

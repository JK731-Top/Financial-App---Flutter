import 'dart:math';
import 'package:finance_charts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  String _stockTitle = "Ford Motor Co (F)";

  bool _periodOneDay = false;
  bool _periodFiveDay = false;
  bool _periodOneMonth = false;
  bool _periodThreeMonth = false;
  bool _periodSixMonth = true;
  bool _periodOneYear = false;


  var rng = new Random();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top : 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            /// heading
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // left button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.arrowLeft,size: 20,),
                      ),
                    ),
                  ),

                  // stock title
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: InkWell(
                      onTap: () {
                        //
                      },
                      child: Center(
                          child: Text("F", style: TextStyle(fontSize: 17),)
                      ),
                    ),
                  ),

                  // right button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Image.asset('assets/images/button.png', width: 30, height: 30),
                  ),

                ],
              ),
            ),

            /// horizontal menu
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: 37,
                    width : MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        topBarTile("Overview", true),
                        topBarTile("Fair Value",false),
                        topBarTile("Earnings",false),
                        topBarTile("Dividend",false),

                      ]),
                    ),

                ],
              ),
            ),

            /// content
            Container(
              height: MediaQuery.of(context).size.height * 0.74,
            width : MediaQuery.of(context).size.width,
            child: ListView(
                padding: const EdgeInsets.only(top : 0),
                scrollDirection: Axis.vertical,
                children: [

                  /// logo
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/logo.png",width: 40,)
                      ],
                    ),
                  ),

                  /// title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_stockTitle, style: TextStyle(fontSize: 30, color: Color(0xff000000)),),
                      ],
                    ),
                  ),

                  /// some value
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\$4.78", style: TextStyle(fontSize: 22, color: Color(0xff1A1A1A)),),
                      ],
                    ),
                  ),

                  /// some value
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("\-\$0.09 (0.32%)", style: TextStyle(fontSize: 14, color: Color(0xffE54B6C)),),
                        SizedBox(width: 15,),
                        Text("CURRENT", style: TextStyle(fontSize: 11, color: Color(0xff757575)),),
                      ],
                    ),
                  ),

                  /// some value
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("+\$0.00 (0.00%)", style: TextStyle(fontSize: 14, color: Color(0xff9DA4B3)),),
                        SizedBox(width: 15,),
                        Text("AFTER-HOURS", style: TextStyle(fontSize: 11, color: Color(0xff757575)),),
                      ],
                    ),
                  ),


                  /// some value
                  Padding(
                    padding: const EdgeInsets.only(left:17 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("6M: -49.53%", style: TextStyle(fontSize: 12, color: Color(0xffE54B6C)),),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  /// graph

                  Stack(children: [
                    Visibility(visible: _periodOneDay, child: SfCartesianChart(


                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },


                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                    Visibility(visible: _periodFiveDay, child: SfCartesianChart(

                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },

                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                    Visibility(visible: _periodOneMonth, child: SfCartesianChart(

                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },

                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                    Visibility(visible: _periodThreeMonth, child: SfCartesianChart(


                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },

                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                    Visibility(visible: _periodSixMonth, child: SfCartesianChart(


                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },

                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                    Visibility(visible: _periodOneYear, child: SfCartesianChart(

                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of y-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 0),
                            isVisible: false
                        ),

                        // primaryXAxis: CategoryAxis(),
                        primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis
                            majorGridLines: MajorGridLines(width: 0),
                            //Hide the axis line of x-axis
                            axisLine: AxisLine(width: 0),
                            labelStyle: TextStyle(color: Colors.red, fontSize: 12),
                            isVisible: false
                        ),

                        // tooltipBehavior: TooltipBehavior(enable: true),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: _stockTitle,
                          format: "point.x value of: point.y",
                        ),
                        palette: [Colors.red],
                        // borderWidth: 2,
                        // borderColor: Colors.red,
                        // enableSideBySideSeriesPlacement: false,
                        isTransposed: false,
                        onPointTapped: (_){
                          //
                        },

                        series: <ChartSeries<_SalesData, String>>[
                          FastLineSeries(dataSource: <_SalesData>[
                            _SalesData('001', rng.nextInt(50)),
                            _SalesData('002', rng.nextInt(50)),
                            _SalesData('003', rng.nextInt(50)),
                            _SalesData('004', rng.nextInt(50)),
                            _SalesData('005', rng.nextInt(50)),
                            _SalesData('006', rng.nextInt(50)),
                            _SalesData('007', rng.nextInt(50)),
                            _SalesData('008', rng.nextInt(50)),
                            _SalesData('009', rng.nextInt(50)),
                            _SalesData('010', rng.nextInt(50)),
                            _SalesData('011', rng.nextInt(50)),
                            _SalesData('012', rng.nextInt(50)),
                            _SalesData('013', rng.nextInt(50)),
                            _SalesData('014', rng.nextInt(50)),
                            _SalesData('015', rng.nextInt(50)),
                            _SalesData('016', rng.nextInt(50)),
                            _SalesData('017', rng.nextInt(50)),
                            _SalesData('018', rng.nextInt(50)),
                            _SalesData('019', rng.nextInt(50)),
                            _SalesData('020', rng.nextInt(50)),
                            _SalesData('021', rng.nextInt(50)),
                            _SalesData('022', rng.nextInt(50)),
                            _SalesData('023', rng.nextInt(50)),
                            _SalesData('024', rng.nextInt(50)),
                            _SalesData('025', rng.nextInt(50)),
                            _SalesData('026', rng.nextInt(50)),
                            _SalesData('027', rng.nextInt(50)),
                            _SalesData('028', rng.nextInt(50)),
                            _SalesData('029', rng.nextInt(50)),
                            _SalesData('030', rng.nextInt(50)),
                            _SalesData('031', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('032', rng.nextInt(50)),
                            _SalesData('033', rng.nextInt(50)),
                            _SalesData('034', rng.nextInt(50)),
                            _SalesData('035', rng.nextInt(50)),
                            _SalesData('036', rng.nextInt(50)),
                            _SalesData('037', rng.nextInt(50)),
                            _SalesData('038', rng.nextInt(50)),
                            _SalesData('039', rng.nextInt(50)),
                            _SalesData('040', rng.nextInt(50)),
                            _SalesData('041', rng.nextInt(50)),
                            _SalesData('042', rng.nextInt(50)),
                            _SalesData('043', rng.nextInt(50)),
                            _SalesData('044', rng.nextInt(50)),
                            _SalesData('045', rng.nextInt(50)),
                            _SalesData('046', rng.nextInt(50)),
                            _SalesData('047', rng.nextInt(50)),
                            _SalesData('101', rng.nextInt(50)),
                            _SalesData('102', rng.nextInt(50)),
                            _SalesData('120', rng.nextInt(50)),
                            _SalesData('121', rng.nextInt(50)),
                            _SalesData('122', rng.nextInt(50)),
                            _SalesData('123', rng.nextInt(50)),
                            _SalesData('124', rng.nextInt(50)),
                            _SalesData('125', rng.nextInt(50)),
                            _SalesData('126', rng.nextInt(50)),
                            _SalesData('127', rng.nextInt(50)),
                            _SalesData('128', rng.nextInt(50)),
                            _SalesData('129', rng.nextInt(50)),
                            _SalesData('130', rng.nextInt(50)),
                            _SalesData('131', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('132', rng.nextInt(50)),
                            _SalesData('133', rng.nextInt(50)),
                            _SalesData('134', rng.nextInt(50)),

                          ], xValueMapper: (_SalesData sales, _) => sales.year, yValueMapper: (_SalesData sales, _) => sales.sales)
                        ]

                    )),
                  ],),

                  SizedBox(height: 10,),

                  /// period selector
                  Padding(
                    padding: const EdgeInsets.only(left :24.0, right: 27),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          GestureDetector(
                            onTap : (){
                              setState(() {
                                _periodOneDay = true;
                                _periodFiveDay = false;
                                _periodOneMonth = false;
                                _periodThreeMonth = false;
                                _periodSixMonth = false;
                                _periodOneYear = false;
                              });
                            },
                              child: periodSelectorTile("1D",_periodOneDay),
                          ),
                          GestureDetector(
                              onTap : (){
                                setState(() {
                                  _periodOneDay = false;
                                  _periodFiveDay = true;
                                  _periodOneMonth = false;
                                  _periodThreeMonth = false;
                                  _periodSixMonth = false;
                                  _periodOneYear = false;
                                });
                              },
                              child: periodSelectorTile("5D",_periodFiveDay)),
                          GestureDetector(
                              onTap : (){
                                setState(() {
                                  _periodOneDay = false;
                                  _periodFiveDay = false;
                                  _periodOneMonth = true;
                                  _periodThreeMonth = false;
                                  _periodSixMonth = false;
                                  _periodOneYear = false;
                                });
                              },
                              child: periodSelectorTile("1M",_periodOneMonth)),
                          GestureDetector(
                              onTap : (){
                                setState(() {
                                  _periodOneDay = false;
                                  _periodFiveDay = false;
                                  _periodOneMonth = false;
                                  _periodThreeMonth = true;
                                  _periodSixMonth = false;
                                  _periodOneYear = false;
                                });
                              },
                              child: periodSelectorTile("3M",_periodThreeMonth)),
                          GestureDetector(
                              onTap : (){
                                setState(() {
                                  _periodOneDay = false;
                                  _periodFiveDay = false;
                                  _periodOneMonth = false;
                                  _periodThreeMonth = false;
                                  _periodSixMonth = true;
                                  _periodOneYear = false;
                                });
                              },
                              child: periodSelectorTile("6M",_periodSixMonth)),
                          GestureDetector(
                              onTap : (){
                                setState(() {
                                  _periodOneDay = false;
                                  _periodFiveDay = false;
                                  _periodOneMonth = false;
                                  _periodThreeMonth = false;
                                  _periodSixMonth = false;
                                  _periodOneYear = true;
                                });
                              },
                              child: periodSelectorTile("1Y",_periodOneYear)),

                        ],
                      ),
                    ),
                  ),

                  /// about title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("About", style: TextStyle(fontSize: 22, color : Color(0xff000000)),),
                      ],
                    ),
                  ),

                  /// about text
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Text(
                            "Ford Motor Co. engages in the manufacture, distribution, \n "
                            "and sale of automobiles. It operates through the following \n "
                            "three segments: Automotive, Mobility, and Ford Credit…",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                            maxLines: 4,
                          ),
                        ],
                    ),
                  ),


                  SizedBox(height: 20,),

                  /// Details title
                  aboutListTile(context, "CEO", "James p. Hackett", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Employees", "190,000", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Industry", "Motor Vehicles", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Sector", "Consumer Durables", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Headquarters", "JDearborn, MI", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Exchange", "New York Stock Exchange", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Website", "http://www.ford.com", true),


                  SizedBox(height: 30,),

                  /// Related Tags title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Related Tags", style: TextStyle(fontSize: 22, color : Color(0xff000000)),),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  /// Tags
                  Padding(
                    padding: const EdgeInsets.only(left:10 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        tags("Automotive"),
                        tags("Dealerships"),
                        tags("Sport Cars"),
                      ],
                    ),
                  ),

                  SizedBox(height: 50,),


                  /// Summary Stats Title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Summary Stats", style: TextStyle(fontSize: 22, color : Color(0xff000000)),),
                      ],
                    ),
                  ),


                  SizedBox(height: 20,),

                  /// Details title
                  aboutListTile(context, "Market Cap", "22.09 B", false),
                  aboutListTileDivider(),
                  // aboutListTile(context, "Revenue", "19.11 B", false),

                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 13.0, right: 13, bottom: 13),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width * 0.20,
                                child: Text("Revenue",textAlign: TextAlign.left, style: TextStyle(fontSize: 15,color: Color(0xff757575)),)),

                            Container(
                              width : MediaQuery.of(context).size.width * 0.25,
                              child: Text("155.90 B",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff000000)),),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width : MediaQuery.of(context).size.width * 0.20,
                              child: Text("Net Income",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff0757575)),),
                            ),
                            Container(
                                width : MediaQuery.of(context).size.width * 0.20,
                                child: Text("19.11 B",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff000000)),),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),


                  aboutListTileDivider(),
                  aboutListTile(context, "EPS", "\$0.03", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Price-to-Earnings", "164.51", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Price-to-Book", "0.58", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Debt-to-Equity", "4.72", false),


                  SizedBox(height: 40,),

                  /// News title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0, right :16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width : MediaQuery.of(context).size.width * 0.45,
                            child: Text("News", style: TextStyle(fontSize: 22, color: Color(0xff000000), fontWeight: FontWeight.bold),),),
                        Container(
                            width : MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Show more ",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff7540EE)),),
                                SizedBox(width: 5,),
                                FaIcon(FontAwesomeIcons.caretRight,size: 20,color: Color(0xff7540EE),)
                              ],
                            )),
                      ],
                    ),
                  ),

                  /// News Horizontal
                  Container(
                    height: 241,
                    width : MediaQuery.of(context).size.width,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [

                          newsTile("Zacks Investment Research","How Badly Will Coronavirus Hit Ford's (F) Q1 Earnings?", "Today 3:34 PM CST", "FCAU -0.13%" ,"GM +1.21%"),
                          newsTile("CNET","Detroit automakers and UAW discuss coronavirus safety to reopen plants", "TToday 1:23 PM CST", "" ,""),
                          newsTile("Zacks Investment Research","How Badly Will Coronavirus Hit Ford's (F) Q1 Earnings?", "Today 3:34 PM CST", "FCAU -0.13%" ,"GM +1.21%"),
                          newsTile("CNET","Detroit automakers and UAW discuss coronavirus safety to reopen plants", "TToday 1:23 PM CST", "" ,""),

                        ]),
                  ),

                  SizedBox(height: 40,),

                  /// ratings title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Analyst Ratings", style: TextStyle(fontSize: 22, color: Color(0xff000000)),),
                      ],
                    ),
                  ),


                  /// ratings text
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Container(
                      child: Text(
                        "Price targets that 15 different analysts have projected for the company",
                        style: TextStyle(
                            fontSize: 13, color: Color(0xffB2B2B2)),
                        maxLines: 4,
                      ),
                    ),
                  ),


                  SizedBox(height: 30,),
                  

                  /// Custom Bars
                  ///
                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left :16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width:50, child: Text("High", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 151,
                          decoration: BoxDecoration(
                            color: Color(0xff32BEB3),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("\$7.00 (+44%)",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff32BEB3)),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width: 50 ,child: Text("Average", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 126,
                          decoration: BoxDecoration(
                            color: Color(0xff32BEB3),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("\$5.59 (+15%)",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff32BEB3)),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width: 50 ,child: Text("Low", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffCDCDCD),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("\$3.59 (-28%)",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Colors.grey),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// text
                  Padding(
                    padding: const EdgeInsets.only(left:16),
                    child: Container(
                      child: Text(
                        "Rating recommendations based on 19 different analysts",
                        style: TextStyle(
                            fontSize: 13, color: Color(0xffB2B2B2)),

                      ),
                    ),
                  ),


                  SizedBox(height: 20,),


                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left :16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width:50, child: Text("Buy", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 59,
                          decoration: BoxDecoration(
                            color: Color(0xff32BEB3),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("4",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff32BEB3)),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width: 50 ,child: Text("Hold", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 126,
                          decoration: BoxDecoration(
                            color: Color(0xffCDCDCD),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("13",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Colors.grey),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  /// bar
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(width: 50 ,child: Text("Sell", style: TextStyle(fontSize: 13, color:Color(0xff757575)),)),
                        SizedBox(width: 10,),

                        Container(
                          height: 14,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xffCDCDCD),
                            borderRadius:
                            BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            ),
                            // border: Border.all(color: Colors.red),
                          ),
                          // child: Center(
                          //   child: Text("aa"),
                          // ),
                        ),
                        SizedBox(width: 10,),
                        Text("2",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Colors.grey),)

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),


                  /// Dividends title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0, right :16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width : MediaQuery.of(context).size.width * 0.45,
                          child: Text("Dividends", style: TextStyle(fontSize: 22, color: Color(0xff000000)),),),
                        Container(
                            width : MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left : 4.0),
                                  child: Image.asset("assets/images/key.png",width: 8, height: 9 ,),
                                ),
                                Text("View detailed data",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff7540EE)),),
                                SizedBox(width: 5,),
                                FaIcon(FontAwesomeIcons.caretRight,size: 20,color: Color(0xff7540EE),)
                              ],
                            )),
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),

                  /// Dividends items
                  aboutListTile(context, "Dividend Date", "May 20, 2020", false),
                  aboutListTileDivider(),
                  aboutListTile(context, "Frequency", "Quarterly", false),
                  aboutListTileDivider(),
                  // aboutListTile(context, "Amount", "\$0.51 Dividend Yield 0.29%", false),


                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 13.0, right: 13, bottom: 13),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width : MediaQuery.of(context).size.width * 0.20,
                                child: Text("Amount",textAlign: TextAlign.left, style: TextStyle(fontSize: 15,color: Color(0xff757575)),)),
                            Container(
                                width : MediaQuery.of(context).size.width * 0.25,
                                child: Text("\$0.51 ",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff000000)),)),
                            SizedBox(width: 5,),
                            Container(
                                width : MediaQuery.of(context).size.width * 0.25,
                                child: Text("Dividend Yield",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff757575)),)),
                            Container(
                                width : MediaQuery.of(context).size.width * 0.20,
                                child: Text("\$0.51 ",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff000000)),)),
                          ],
                        ),


                      ],
                    ),
                  ),

                  SizedBox(height: 20,),


                  /// Dividends title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0, right :16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width : MediaQuery.of(context).size.width * 0.45,
                          child: Text("Earnings", style: TextStyle(fontSize: 22, color: Color(0xff000000)),),),
                        Container(
                            width : MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left : 4.0),
                                  child: Image.asset("assets/images/key.png",width: 8, height: 9 ,),
                                ),
                                Text("View detailed data",textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: Color(0xff7540EE)),),
                                SizedBox(width: 5,),
                                FaIcon(FontAwesomeIcons.caretRight,size: 20,color: Color(0xff7540EE),)
                              ],
                            )),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),

                  
                  /// Earnings text
                  Padding(
                    padding: const EdgeInsets.only(left:16),
                    child: Container(
                      child: Text(
                        "Most Recent Earnings",
                        style: TextStyle(
                            fontSize: 16, color: Color(0xff000000)),
                        maxLines: 4,
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  /// Earning card
                  Padding(
                    padding: const EdgeInsets.only(left : 16),
                    child: Center(
                      child: Container(
                        height: 67,
                        width: 315,
                        // width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                          border: Border.all(color: Color(0xff979797)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Container(
                              // width: MediaQuery.of(context).size.width * 0.90 * 0.65,
                              width: 220,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left :23.0, top :8 , right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Last Earning for", style :TextStyle(fontSize : 18, color: Color(0xff000000), fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left :23, top :0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Q1 2020", style :TextStyle(fontSize : 18, color: Color(0xff000000), fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),),


                            Container(width: 1, height: 50,decoration: BoxDecoration(color: Colors.grey,),),


                            Container(
                              // width: MediaQuery.of(context).size.width * 0.90 * 0.30,
                              width: 60,
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("04",style :TextStyle(fontSize : 22, color: Color(0xff1A1A1A))),
                                Text("APR",style :TextStyle(fontSize : 18, color: Color(0xff757575))),
                              ],
                            ),),


                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 25,),
                  

                  /// earnings details
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width : MediaQuery.of(context).size.width * 0.47,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Last Earnings",style :TextStyle(fontSize : 12, color: Color(0xff757575))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Missed by", style :TextStyle(fontSize : 18.5, color: Color(0xffE54B6C))),
                                  Text("\$0.05", style :TextStyle(fontSize : 18.5, color: Color(0xffE54B6C))),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width : MediaQuery.of(context).size.width * 0.47,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Actual",style :TextStyle(fontSize : 12, color: Color(0xff757575))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("0.12", style :TextStyle(fontSize : 15, color: Color(0xffE54B6C))),
                                  Text("-29%", style :TextStyle(fontSize : 13, color: Color(0xffE54B6C))),
                                ],
                              ),
                            ],
                          ),
                        ),




                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  
                  
                  /// earnings details
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width : MediaQuery.of(context).size.width * 0.32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Consensus",style :TextStyle(fontSize : 12, color: Color(0xff757575))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("0.17", style :TextStyle(fontSize : 15, color: Color(0xff000000))),

                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width : MediaQuery.of(context).size.width * 0.30,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Year Ago",style :TextStyle(fontSize : 12, color: Color(0xff757575))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("0.30", style :TextStyle(fontSize : 15, color: Color(0xff000000))),
                
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width : MediaQuery.of(context).size.width * 0.32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Year Ago Change %",style :TextStyle(fontSize : 12, color: Color(0xff757575))),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Down 60%", style :TextStyle(fontSize : 15, color: Color(0xffE54B6C))),

                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),


                  SizedBox(height: 40,),
                  

                  /// Estimates text
                  Padding(
                    padding: const EdgeInsets.only(left:16),
                    child: Container(
                      child: Text(
                        "Actual vs Estimates",
                        style: TextStyle(
                            fontSize: 16, color: Color(0xff000000)),
                        maxLines: 4,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  /// Estimates card
                  Center(
                    child: Container(
                      height: 67,
                      width: 315,
                      // width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(color: Color(0xff979797)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            // width: MediaQuery.of(context).size.width * 0.90 * 0.65,
                            width: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left :23.0, top :8 , right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Upcoming Earnings for", style :TextStyle(fontSize : 18, color: Color(0xff000000), fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left :23.0, top :0 , right: 23),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Q2 2020", style :TextStyle(fontSize : 18, color: Color(0xff000000), fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),),
                          Container(width: 1, height: 50,decoration: BoxDecoration(color: Color(0xff7540EE)),),


                          Container(
                            // width: MediaQuery.of(context).size.width * 0.90 * 0.30,
                            width: 60,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("19",style :TextStyle(fontSize : 22, color: Color(0xff1A1A1A))),
                              Text("APR",style :TextStyle(fontSize : 18, color: Color(0xff757575))),
                            ],
                          ),),


                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),


                  /// DOts vertical
                  Padding(
                    padding: const EdgeInsets.only(left :16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              height:80,
                              child: Stack(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top : 45.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffCDCDCD),
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top :20.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff7540EE),

                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            

                            SizedBox(height :10),
                            Container(width:30, child: Center(child: Text("Q3", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),
                            Container(width:30, child: Center(child: Text("2019", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),

                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              height:80,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top : 45.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffCDCDCD),
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top :35.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff7540EE),

                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  )

                                ],
                              ),
                            ),


                            SizedBox(height :10),
                            Container(width:30, child: Center(child: Text("Q3", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),
                            Container(width:30, child: Center(child: Text("2019", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),

                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              height:80,
                              child: Stack(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top : 45.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffCDCDCD),
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top :0.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xff7540EE),

                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  )

                                ],
                              ),
                            ),


                            SizedBox(height :10),
                            Container(width:30, child: Center(child: Text("Q3", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),
                            Container(width:30, child: Center(child: Text("2019", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),

                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Container(
                              height:80,
                              child: Stack(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top : 45.0),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xffCDCDCD),
                                        borderRadius:
                                        BorderRadius.only(
                                          topLeft: Radius.circular(7.5),
                                          topRight: Radius.circular(7.5),
                                          bottomRight: Radius.circular(7.5),
                                          bottomLeft: Radius.circular(7.5),
                                        ),
                                        // border: Border.all(color: Colors.red),
                                      ),
                                      // child: Center(
                                      //   child: Text("aa"),
                                      // ),
                                    ),
                                  ),

                                ],
                              ),
                            ),


                            SizedBox(height :10),
                            Container(width:30, child: Center(child: Text("Q3", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),
                            Container(width:30, child: Center(child: Text("2019", style: TextStyle(fontSize: 11, color:Color(0xff969696)),))),

                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  
                  
                  /// Dots Graph Summary
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        // Expected EPS
                        Container(
                            width :MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Column(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xffCDCDCD),
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft: Radius.circular(7.5),
                                        topRight: Radius.circular(7.5),
                                        bottomRight: Radius.circular(7.5),
                                        bottomLeft: Radius.circular(7.5),
                                      ),
                                      // border: Border.all(color: Colors.red),
                                    ),
                                    // child: Center(
                                    //   child: Text("aa"),
                                    // ),
                                  )
                                ],
                              ),
                              Column(
                                children: [Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Expected EPS", style: TextStyle(fontSize: 12, color:Color(0xff505D6F)),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Q2 2020", style: TextStyle(fontSize: 12, color:Color(0xff505D6F)),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("-\$0.08", style: TextStyle(fontSize: 18.5, color:Color(0xff000000), fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ),
                              ],
                          )],),
                        ],)),

                        // Actual EPS
                        Container(
                            width :MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Color(0xff7540EE),
                                      borderRadius:
                                      BorderRadius.only(
                                        topLeft: Radius.circular(7.5),
                                        topRight: Radius.circular(7.5),
                                        bottomRight: Radius.circular(7.5),
                                        bottomLeft: Radius.circular(7.5),
                                      ),
                                      // border: Border.all(color: Colors.red),
                                    ),
                                    // child: Center(
                                    //   child: Text("aa"),
                                    // ),
                                  )
                                ],
                              ),
                              Column(
                                children: [Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Actual EPS", style: TextStyle(fontSize: 12, color:Color(0xff505D6F)),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Q2 2020", style: TextStyle(fontSize: 12, color:Color(0xff505D6F)),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left :10, bottom :5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("--", style: TextStyle(fontSize: 18.5, color:Color(0xff7540EE), fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ),
                                  ],
                                )],),
                            ],)),

                      ],
                    ),
                  ),
                  

                  SizedBox(height: 40,),

                  /// Competitors title
                  Padding(
                    padding: const EdgeInsets.only(left:16 , top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Competitors", style: TextStyle(fontSize: 22, color: Color(0xff000000)),),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),

                  /// Competitors Horizontal
                  Container(
                    height: 182,
                    width : MediaQuery.of(context).size.width,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [

                          competitorsTile("TSLA", "Tesla Motors","\$232.30", "+2.34%" ,"SB", "tesla_logo", "sb"),
                          competitorsTile("SPOT", "Spotify Technology SA","\$138.55", "+2.34%" ,"S", "spot_logo", "s"),
                          competitorsTile("FORD", "ford",  "\$138.55" ,"+2.34%", "", "ford_logo", ""),

                        ]),
                  ),

                  SizedBox(height: 10,),

                ]),
          ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 45,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bottom_1.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0, bottom :0 ),
                // child: Text(""),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bottom_2.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0),
                // child: Text(""),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bottom_3.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0),
                // child: Text(""),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bottom_4.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0),
                // child: Text(""),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/bottom_5.png"),size: 25,),
              title: Padding(
                padding: EdgeInsets.only(top: 3.0),
                // child: Text(""),
              ),
            ),
          ],
        ),
      ),


    );
  }
}


class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
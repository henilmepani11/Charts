import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:week92/charts/pie.dart';

class Bar extends StatelessWidget {
  Bar({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      year: "2014",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
        year: "2015",
        financial: 300,
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    BarChartModel(
        year: "2016",
        financial: 100,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    BarChartModel(
        year: "2017",
        financial: 450,
        color: charts.ColorUtil.fromDartColor(Colors.yellow)),
    BarChartModel(
        year: "2018",
        financial: 630,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent)),
    BarChartModel(
        year: "2019",
        financial: 950,
        color: charts.ColorUtil.fromDartColor(Colors.pink)),
    BarChartModel(
        year: "2020",
        financial: 400,
        color: charts.ColorUtil.fromDartColor(Colors.purple))
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      )
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Bar Charts"), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pie()));
            },
            icon: Icon(Icons.arrow_forward_rounded))
      ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}

class BarChartModel {
  String year;
  int financial;
  final charts.Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

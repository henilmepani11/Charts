import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:week92/charts/bar.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SalesData> data = [
    SalesData("Jan", 35),
    SalesData("Feb", 28),
    SalesData("Mar", 34),
    SalesData("Apr", 32),
    SalesData("May", 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Line Charts"), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Bar()));
            },
            icon: Icon(Icons.arrow_forward_rounded))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: "Half Yearly Sales Analysis"),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<SalesData, String>>[
              LineSeries(
                  name: "Sales",
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Pie extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Android": 2,
    "Ionic": 2,
  };
  Pie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Charts"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: PieChart(
            dataMap: dataMap,
            chartRadius: MediaQuery.of(context).size.width / 1.7,
            legendOptions: LegendOptions(
              legendPosition: LegendPosition.bottom,
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: true,
            ),
          ),
        ),
      ),
    );
  }
}

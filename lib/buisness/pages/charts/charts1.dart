import 'package:diginas_app/buisness/pages/charts/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart1 extends StatefulWidget {
  bool show;
  Chart1({Key? key, this.show = true}) : super(key: key);

  @override
  State<Chart1> createState() => _Chart1State();
}

class _Chart1State extends State<Chart1> {
  Map<String, double> dataMap = {
    "Nour Kalai": 20,
    "Rihen Houli": 70,
    "Emna Rbai": 8,
    "Nada Sayes": 8,
  };
  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(6, 248, 18, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(4, 79, 141, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(241, 53, 6, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: PieChart(
        dataMap: dataMap,
        colorList: colorList,
        chartRadius: 20,
        ringStrokeWidth: 50,
        animationDuration: const Duration(seconds: 3),
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesOutside: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false),
        legendOptions: const LegendOptions(
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(fontSize: 10),
            legendPosition: LegendPosition.bottom,
            showLegendsInRow: true),
        gradientList: gradientList,
      )),
    );
  }
}

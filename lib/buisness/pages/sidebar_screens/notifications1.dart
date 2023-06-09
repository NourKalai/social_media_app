import 'package:diginas_app/buisness/pages/charts/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Marketing1 extends StatefulWidget {
  const Marketing1({Key? key}) : super(key: key);

  @override
  State<Marketing1> createState() => _Marketing1State();
}

class _Marketing1State extends State<Marketing1> {
  Map<String, double> dataMap = {
    "Nour": 18.47,
    "Nada": 17.70,
    "Rihen": 4.25,
    "Other": 2.83,
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
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Pie Chart example"),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  centerText: "Reach",
                  ringStrokeWidth: 24,
                  animationDuration: const Duration(seconds: 3),
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: true,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendShape: BoxShape.rectangle,
                      legendTextStyle: TextStyle(fontSize: 15),
                      legendPosition: LegendPosition.bottom,
                      showLegendsInRow: true),
                  gradientList: gradientList,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Views"),
          Expanded(child: BarChartSample2())
        ],
      ),
    );
  }
}

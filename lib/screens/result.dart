import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Result extends StatefulWidget {
  double catererAmount;
  double photographerAmount;
  double decoratoramount;
  Result({
    Key? key,
    this.catererAmount = 0,
    this.decoratoramount = 0,
    this.photographerAmount = 0,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late Map<String, double> dataMap;
  final colorList = <Color>[
    Color(0xfffdcb6e),
    Color(0xff0984e3),
    Color(0xfffd79a8),
  ];
  double sum = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sum = widget.catererAmount +
        widget.decoratoramount +
        widget.photographerAmount;
    dataMap = {
      "Caterer": (widget.catererAmount * 100) / sum,
      "Photographer": (widget.photographerAmount * 100) / sum,
      "Deorator": (widget.decoratoramount * 100) / sum,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: ListView(
        children: <Widget>[
          const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Expense-Chart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('Profession',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Amount',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('Photographer')),
                DataCell(Text(widget.photographerAmount.toString())),
              ]),
              DataRow(cells: [
                const DataCell(Text('Caterer')),
                DataCell(Text(widget.catererAmount.toString())),
              ]),
              DataRow(cells: [
                const DataCell(Text('Decorator')),
                DataCell(Text(widget.decoratoramount.toString())),
              ])
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                Text(sum.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              // centerText: "HYBRID",
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),
          )
        ],
      ),
    );
  }
}

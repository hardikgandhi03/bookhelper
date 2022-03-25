import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';

class chartDisplay extends StatefulWidget {
  chartDisplay({Key? key}) : super(key: key);
  @override
  _chartDisplayState createState() => _chartDisplayState();
}

// ignore: camel_case_types
class _chartDisplayState extends State<chartDisplay> {
  late List<Ratings> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.blue.shade200,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              //borderRadius: BorderRadius.circular(12),
              //color: Colors.blue[300],
            ),
            width: double.infinity,
            child: Container(
              child: SfCartesianChart(
                title: ChartTitle(text: 'Ratings'),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  BarSeries<Ratings, String>(
                      name: 'count',
                      dataSource: _chartData,
                      xValueMapper: (Ratings count, _) => count.string,
                      yValueMapper: (Ratings count, _) => count.count,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                    title: AxisTitle(text: 'Ratings of the book')),
              ),
            ),
          )
        ],
      ),
    ));
  }

  List<Ratings> getChartData() {
    final List<Ratings> chartData = [
      Ratings('5 star', 36),
      Ratings('4 star', 24),
      Ratings('3 star', 29),
      Ratings('2 star', 23),
      Ratings('1 star', 14),
    ];
    return chartData;
  }
}

class Ratings {
  Ratings(this.string, this.count);
  final String string;
  final double count;
}

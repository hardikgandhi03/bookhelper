import 'package:bookhelper/screens/explorebooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';

class chartDisplay extends StatefulWidget {
  chartDisplay(
      {Key? key,
      required String star2,
      required String star1,
      required String star3,
      required String star4,
      required String star5})
      : super(key: key);

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
        //color: Colors.blue.shade200,
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
                        // dataSource: [
                        //   Ratings('5 star', 36),
                        //   Ratings('4 star', 24),
                        //   Ratings('3 star', 29),
                        //   Ratings('2 star', 23),
                        //   Ratings('1 star', 14),
                        // ],
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
      ),
    );
  }

  List<Ratings> getChartData() {
    // final List<Ratings> chartData = [
    //   Ratings('5 star', int.parse("widget.star5[2:]")),
    //   Ratings('4 star', int.parse("widget.star4[2:]")),
    //   Ratings('3 star', int.parse("widget.star3[2:]")),
    //   Ratings('2 star', int.parse("widget.star2[2:]")),
    //   Ratings('1 star', int.parse("widget.star1[2:]")),
    // ];
    final List<Ratings> chartData = [
      Ratings('5 star', 36),
      Ratings('4 star', 25),
      Ratings('3 star', 16),
      Ratings('2 star', 8),
      Ratings('1 star', 30),
    ];
    return chartData;
  }
}

class Ratings {
  Ratings(this.string, this.count);
  final String string;
  final int count;
}

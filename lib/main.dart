import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: WaterConsumptionColumnChart(),
        ),
      ),
    );
  }
}

class WaterConsumptionColumnChart extends StatelessWidget {
  const WaterConsumptionColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Turkmenistan', 15445),
      ChartData('Chile', 5880),
      ChartData('Guyana', 5284),
      ChartData('Uzbekistan', 4778),
      ChartData('Tajikistan', 4460),
      ChartData('Kyrgyzstan', 4153),
      ChartData('United-States', 3732),
      ChartData('Iran', 3638),
      ChartData('Estonia', 3585),
      ChartData('Azerbaijan', 3512),
      ChartData('Timor', 3456),
      ChartData('Finland', 3414),
      ChartData('Kazakhstan', 3397),
      ChartData('New-Zealand', 3277),
      ChartData('Suriname', 3214),
    ];

    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/backgroundImage.png'),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(
          isVisible: false,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Liters per Capita'),
          minimum: 2000,
          maximum: 17000,
          majorGridLines: MajorGridLines(width: 0),
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          header: '',
          canShowMarker: false,
          color: Colors.blue,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        series: <ColumnSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade900],
              stops: const [0.0, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              builder: (data, point, series, pointIndex, seriesIndex) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage('assets/images/${data.country}.png'),
                      width: 30,
                      height: 30,
                    ),
                  ],
                );
              },
            ),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.country,
            yValueMapper: (ChartData data, _) => data.waterUsage,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.country, this.waterUsage);
  final String country;
  final double waterUsage;
}

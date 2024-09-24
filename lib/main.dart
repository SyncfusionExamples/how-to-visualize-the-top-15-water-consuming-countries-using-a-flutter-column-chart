import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() => runApp(const WaterConsumptionAnalyzeChart());

class WaterConsumptionAnalyzeChart extends StatelessWidget {
  const WaterConsumptionAnalyzeChart({super.key});

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
    final List<WaterConsumptionData> waterUsageData = [
      WaterConsumptionData('Turkmenistan', 15445),
      WaterConsumptionData('Chile', 5880),
      WaterConsumptionData('Guyana', 5284),
      WaterConsumptionData('Uzbekistan', 4778),
      WaterConsumptionData('Tajikistan', 4460),
      WaterConsumptionData('Kyrgyzstan', 4153),
      WaterConsumptionData('United-States', 3732),
      WaterConsumptionData('Iran', 3638),
      WaterConsumptionData('Estonia', 3585),
      WaterConsumptionData('Azerbaijan', 3512),
      WaterConsumptionData('Timor', 3456),
      WaterConsumptionData('Finland', 3414),
      WaterConsumptionData('Kazakhstan', 3397),
      WaterConsumptionData('New-Zealand', 3277),
      WaterConsumptionData('Suriname', 3214),
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
      child: SfTheme(
        data: SfThemeData(
          chartThemeData: const SfChartThemeData(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        child: SfCartesianChart(
          title: const ChartTitle(
            text: 'Top 15 Water-Consuming Countries by Daily Usage (Liters)',
          ),
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          series: <ColumnSeries<WaterConsumptionData, String>>[
            ColumnSeries<WaterConsumptionData, String>(
              dataSource: waterUsageData,
              xValueMapper: (WaterConsumptionData data, int index) =>
                  data.country,
              yValueMapper: (WaterConsumptionData data, int index) =>
                  data.waterUsage,
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade900],
                stops: const [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                builder: (dynamic data,
                    ChartPoint<dynamic> point,
                    ChartSeries<dynamic, dynamic> series,
                    int pointIndex,
                    int seriesIndex) {
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
            ),
          ],
        ),
      ),
    );
  }
}

class WaterConsumptionData {
  WaterConsumptionData(this.country, this.waterUsage);
  final String country;
  final double waterUsage;
}

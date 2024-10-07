import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

class WaterConsumptionColumnChart extends StatefulWidget {
  const WaterConsumptionColumnChart({super.key});

  @override
  WaterConsumptionColumnChartState createState() =>
      WaterConsumptionColumnChartState();
}

class WaterConsumptionColumnChartState
    extends State<WaterConsumptionColumnChart> {
  late List<WaterConsumptionData> _waterUsageData;
  late DataLabelSettings _dataLabelSettings;
  late LinearGradient _gradient;

  @override
  void initState() {
    super.initState();
    _waterUsageData = [
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

    _dataLabelSettings = DataLabelSettings(
      isVisible: true,
      builder: (dynamic data,
          ChartPoint<dynamic> point,
          ChartSeries<dynamic, dynamic> series,
          int pointIndex,
          int seriesIndex) {
        return Image(
          image: AssetImage('assets/images/${data.country}.png'),
          width: 30,
          height: 30,
        );
      },
    );

    _gradient = LinearGradient(
      colors: [
        Colors.blue.shade400,
        Colors.blue.shade900,
      ],
      stops: const [0.3, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.lightBlue.withOpacity(0.3),
      title: const ChartTitle(
        text: 'Top 15 Water-Consuming Countries by Daily Usage (Gallons)',
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      primaryXAxis: const CategoryAxis(
        title: AxisTitle(
          text: 'Countries',
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        title: AxisTitle(
          text: 'Gallons per Capita',
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        majorGridLines: MajorGridLines(width: 0),
      ),
      series: <ColumnSeries<WaterConsumptionData, String>>[
        ColumnSeries<WaterConsumptionData, String>(
          dataSource: _waterUsageData,
          xValueMapper: (WaterConsumptionData data, int index) => data.country,
          yValueMapper: (WaterConsumptionData data, int index) =>
              data.waterUsageInGallon,
          gradient: _gradient,
          dataLabelSettings: _dataLabelSettings,
        ),
      ],
    );
  }
}

class WaterConsumptionData {
  WaterConsumptionData(this.country, this.waterUsageInGallon);
  final String country;
  final double waterUsageInGallon;
}

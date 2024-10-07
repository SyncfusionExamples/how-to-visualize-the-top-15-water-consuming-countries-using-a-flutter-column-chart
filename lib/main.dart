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
  late List<WaterConsumptionData> _yearlyWaterUsageData;
  late DataLabelSettings _dataLabelSettings;
  late LinearGradient _gradient;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _yearlyWaterUsageData = [
      WaterConsumptionData('India', 761000000000, 2010),
      WaterConsumptionData('China', 598100000000, 2015),
      WaterConsumptionData('United-States', 444300000000, 2015),
      WaterConsumptionData('Indonesia', 222600000000, 2016),
      WaterConsumptionData('Pakistan', 183500000000, 2008),
      WaterConsumptionData('Iran', 93300000000, 2004),
      WaterConsumptionData('Mexico', 86580000000, 2016),
      WaterConsumptionData('Philippines', 85140000000, 2016),
      WaterConsumptionData('Vietnam', 82030000000, 2005),
      WaterConsumptionData('Japan', 81450000000, 2009),
      WaterConsumptionData('Egypt', 77500000000, 2017),
      WaterConsumptionData('Russia', 69500000000, 2016),
      WaterConsumptionData('Brazil', 63500000000, 2016),
      WaterConsumptionData('Turkey', 58950000000, 2016),
      WaterConsumptionData('Thailand', 57310000000, 2007),
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

    _tooltipBehavior = TooltipBehavior(
      enable: true,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(5),
          color: Colors.blue,
          child: Text(
            'Year: ${data.year.toInt()}',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.lightBlue.withOpacity(0.3),
      title: const ChartTitle(
        text:
            'Top 15 Yearly Water-Consuming Countries In Cubic Meters Thousands Of Liters',
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
          text: 'Cubic Meters Thousands Of Liters',
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        majorGridLines: MajorGridLines(width: 0),
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <ColumnSeries<WaterConsumptionData, String>>[
        ColumnSeries<WaterConsumptionData, String>(
          dataSource: _yearlyWaterUsageData,
          xValueMapper: (WaterConsumptionData data, int index) => data.country,
          yValueMapper: (WaterConsumptionData data, int index) =>
              data.yearlyWaterUsage,
          gradient: _gradient,
          dataLabelSettings: _dataLabelSettings,
        ),
      ],
    );
  }
}

class WaterConsumptionData {
  WaterConsumptionData(this.country, this.yearlyWaterUsage, this.year);
  final String country;
  final double yearlyWaterUsage;
  final double year;
}

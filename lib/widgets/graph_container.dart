import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theweather/utlity/functions/functions.dart';
import 'package:theweather/models/hourly_weather_model.dart';

class GraphContainer extends StatelessWidget {
  final List<Data>? hourlyDatas;
  final int indexOfDay;
  const GraphContainer(
      {super.key, required this.hourlyDatas, required this.indexOfDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width * 2,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: LineChart(LineChartData(
                maxX: 24,
                minX: 0,
                maxY: 170,
                minY: -170,
                gridData: const FlGridData(show: false),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blue,
                    getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                      return lineBarsSpot.map((LineBarSpot spot) {
                        return LineTooltipItem(
                          ' ${getHour(getHourlyList(hourlyDatas, indexOfDay)?[spot.spotIndex].timestampLocal)}:00\n ${getHourlyList(hourlyDatas, indexOfDay)?[spot.spotIndex].temp?.round()}°',
                          const TextStyle(color: Colors.black),
                        );
                      }).toList();
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(
                          0, getHourlyList(hourlyDatas, indexOfDay)![0].temp!),
                      FlSpot(
                          1, getHourlyList(hourlyDatas, indexOfDay)![1].temp!),
                      FlSpot(
                          2, getHourlyList(hourlyDatas, indexOfDay)![2].temp!),
                      FlSpot(
                          3, getHourlyList(hourlyDatas, indexOfDay)![3].temp!),
                      FlSpot(
                          4, getHourlyList(hourlyDatas, indexOfDay)![4].temp!),
                      FlSpot(
                          5, getHourlyList(hourlyDatas, indexOfDay)![5].temp!),
                      FlSpot(
                          6, getHourlyList(hourlyDatas, indexOfDay)![6].temp!),
                      FlSpot(
                          7, getHourlyList(hourlyDatas, indexOfDay)![7].temp!),
                      FlSpot(
                          8, getHourlyList(hourlyDatas, indexOfDay)![8].temp!),
                      FlSpot(
                          9, getHourlyList(hourlyDatas, indexOfDay)![9].temp!),
                      FlSpot(10,
                          getHourlyList(hourlyDatas, indexOfDay)![10].temp!),
                      FlSpot(11,
                          getHourlyList(hourlyDatas, indexOfDay)![11].temp!),
                      FlSpot(12,
                          getHourlyList(hourlyDatas, indexOfDay)![12].temp!),
                      FlSpot(13,
                          getHourlyList(hourlyDatas, indexOfDay)![13].temp!),
                      FlSpot(14,
                          getHourlyList(hourlyDatas, indexOfDay)![14].temp!),
                      FlSpot(15,
                          getHourlyList(hourlyDatas, indexOfDay)![15].temp!),
                      FlSpot(16,
                          getHourlyList(hourlyDatas, indexOfDay)![16].temp!),
                      FlSpot(17,
                          getHourlyList(hourlyDatas, indexOfDay)![17].temp!),
                      FlSpot(18,
                          getHourlyList(hourlyDatas, indexOfDay)![18].temp!),
                      FlSpot(19,
                          getHourlyList(hourlyDatas, indexOfDay)![19].temp!),
                      FlSpot(20,
                          getHourlyList(hourlyDatas, indexOfDay)![20].temp!),
                      FlSpot(21,
                          getHourlyList(hourlyDatas, indexOfDay)![21].temp!),
                      FlSpot(22,
                          getHourlyList(hourlyDatas, indexOfDay)![22].temp!),
                      FlSpot(23,
                          getHourlyList(hourlyDatas, indexOfDay)![23].temp!),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue[400]!, Colors.blue[900]!]),
                    barWidth: 5,
                  )
                ])),
          ),
        ),
      ),
    );
  }
}

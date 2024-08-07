import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RadarChartWidget extends StatelessWidget {
  final List<String> titles;
  final List<double> values;

  RadarChartWidget({
    required this.titles,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16.0),
      child: RadarChart(
        RadarChartData(
          radarTouchData: RadarTouchData(
            touchCallback: (FlTouchEvent event, response) {
              if (!event.isInterestedForInteractions) {
                return;
              }
              if (response == null) {
                return;
              }
            },
          ),
          dataSets: [
            RadarDataSet(
              fillColor: Colors.white.withOpacity(0.5),
              borderColor: Colors.transparent,
              entryRadius: 1,
              dataEntries: List.generate(values.length, (index) => RadarEntry(value: values[index])),
            ),
          ],
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: false),
          radarBorderData: BorderSide.none,
          getTitle: (value) {
            int index = value.toInt() % titles.length;
            if (index < 0 || index >= titles.length) {
              return '';
            }
            return titles[index];
          },
          tickCount: 7,
          tickBorderData: BorderSide(
            width: 1,
            color: Color.fromRGBO(182, 151, 117, 1),
          ),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(182, 151, 117, 1),
            fontSize: 10,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
          ticksTextStyle: TextStyle(
            color: Color.fromRGBO(182, 151, 117, 1),
            fontSize: 0,
          ),
          gridBorderData: BorderSide(
            color: Color.fromRGBO(182, 151, 117, 1),
            width: 0.8,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: true),
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: const [
              FlSpot(0, 10), // Day 1
              FlSpot(1, 12), // Day 2
              FlSpot(2, 8), // Day 3
              FlSpot(3, 14), // Day 4
              FlSpot(4, 10), // Day 5
            ],
            color: Color.fromARGB(255, 0, 17, 171), // for line color
            belowBarData: BarAreaData(
                show: true,
                color: Color.fromARGB(255, 0, 17, 171).withOpacity(
                    0.2)), // Updated `color` for the area below the line
          ),
        ],
      ),
    );
  }
}

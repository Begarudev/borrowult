import 'package:borrowult/utils/theme_consts.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0, 
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: true,
          ),
          sections: [
            PieChartSectionData(
                color: Colors.transparent,
                title: 'Lend',
                radius: 80,
                value: 30, 
                showTitle: false,
                borderSide: BorderSide(width: 10, color: lendColor)),
            PieChartSectionData(
                color: Colors.transparent,
                title: 'Borrow',
                radius: 80,
                value: 70, 
                showTitle: false,
                borderSide: BorderSide(width: 10, color: borrowColor)),
          ],
          sectionsSpace: 12, // Gap between sections
          centerSpaceRadius:
              0, 
        ),
      ),
    );
  }
}

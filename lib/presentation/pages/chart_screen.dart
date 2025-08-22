import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constatnts/font_types.dart';
import '../../../core/constatnts/colors.dart';

class ChartDetailsScreen extends StatelessWidget {
  final int chartIndex;
  final List<String> zones;
  final List<int> targetLeads;
  final List<int> actualLeads;

  const ChartDetailsScreen({
    super.key,
    required this.chartIndex,
    required this.zones,
    required this.targetLeads,
    required this.actualLeads,
  });

  List<BarChartGroupData> _generateBarGroups(double barWidth) {
    return List.generate(zones.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 6,
        barRods: [
          BarChartRodData(
            toY: targetLeads[index].toDouble(),
            color: Colors.orange,
            width: barWidth,
            borderRadius: BorderRadius.circular(3),
          ),
          BarChartRodData(
            toY: actualLeads[index].toDouble(),
            color: Colors.deepOrange,
            width: barWidth,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chart ${chartIndex + 1} Details",
          style: TextStyle(fontFamily: MyFonts.poppins, color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double availableWidth = constraints.maxWidth;
          double totalBars = zones.length * 2;
          double barWidth = (availableWidth - (zones.length * 10)) / totalBars;

          if (barWidth < 14) barWidth = 14;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ FIXED Y-AXIS NUMBERS
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                          (index) {
                        final value = (2200 ~/ 5) * index;
                        return Text(
                          value.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: MyFonts.poppins,
                          ),
                        );
                      },
                    ).reversed.toList(),
                  ),
                ),

                const SizedBox(width: 10),

                // ✅ SCROLLABLE CHART WITH FIXED HEIGHT
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: zones.length * 90,
                      height: 1000, // 👈 Reduce chart height here
                      child: BarChart(
                        BarChartData(
                          maxY: 2200,
                          barGroups: _generateBarGroups(barWidth),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: false),
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 60,
                                getTitlesWidget: (value, meta) {
                                  if (value.toInt() < zones.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Transform.rotate(
                                        angle: -0.5,
                                        child: Text(
                                          zones[value.toInt()],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFonts.poppins,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

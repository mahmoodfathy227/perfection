
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/mock_data.dart';
import '../responsive.dart';
import '../styles/styles.dart';
import 'currency_text.dart';


class BarChartWithTitle extends StatelessWidget {
  final String title;
  final Color barColor;
  final double amount;

  const BarChartWithTitle({
    Key? key,
    required this.title,
    required this.amount,
    required this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Styles.defaultBorderRadius,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          const SizedBox(height: 10),
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CurrencyText(
                      currency: "",
                      amount: amount.toInt(),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'on this week',
                      style: TextStyle(
                        color: Styles.defaultGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              : Column(

                  children: <Widget>[
                    CurrencyText(
                      currency: "",
                      amount: amount.toInt(),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'on this week',
                      style: TextStyle(
                        color: Styles.defaultGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(

                    getTooltipItem: (_a, _b, _c, _d) => null,
                  ),
                ),

                borderData: FlBorderData(

                  show: false,
                ),
                barGroups: MockData.getBarChartitems(

                  barColor,
                  width: Responsive.isMobile(context) ? 5 : 25,
                ),
                gridData: FlGridData(show: false),

              ),
            ),
          ),
        ],
      ),
    );
  }
}

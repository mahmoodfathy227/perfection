import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../home/controllers/home_controller.dart';
import '../styles/styles.dart';
import '../widgets/bar_chart_with_title.dart';

class ExpenseIncomeCharts extends StatelessWidget {
  const ExpenseIncomeCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Obx(() {
      return Row(
        children: [
          Flexible(
            child: BarChartWithTitle(
              title: "New Users",
              amount:
              homeController.totalUsers.value == null
                  ? 0 :
              homeController.totalUsers.value.toDouble(),
              barColor: Styles.defaultBlueColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: BarChartWithTitle(
              title: "Old Users",
              amount:
              homeController.totalUsers.value == null
                  ? 0 :
              homeController.totalUsers.value.toDouble(),
              barColor: Styles.defaultRedColor,
            ),
          ),
        ],
      );
    });
  }
}

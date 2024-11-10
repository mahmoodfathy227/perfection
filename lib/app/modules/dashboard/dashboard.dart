import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfection/app/modules/dashboard/responsive.dart';
import 'package:perfection/app/modules/dashboard/sections/expense_income_chart.dart';
import 'package:perfection/app/modules/dashboard/sections/latest_transactions.dart';
import 'package:perfection/app/modules/dashboard/sections/statics_by_category.dart';
import 'package:perfection/app/modules/dashboard/sections/upgrade_pro_section.dart';
import 'package:perfection/app/modules/dashboard/sections/your_cards_section.dart';
import 'package:perfection/app/modules/dashboard/styles/styles.dart';
import 'package:perfection/app/modules/home/controllers/home_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'layout/app_layout.dart';
import 'models/card_details.dart';
import 'models/enums/card_type.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _HomePageState();
}

class _HomePageState extends State<DashboardPage> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Styles.defaultLightWhiteColor,
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        return SafeArea(
            child: Skeletonizer(
              enabled: homeController.isLoading.value,
              child: AppLayout(
                content: Row(
                  children: [
                    // Main Panel
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: ExpenseIncomeCharts(),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Styles.defaultPadding,
                              ),
                              child: const UpgradeProSection(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: LatestTransactions(),
                          ),
                        ],
                      ),
                    ),
                    // Right Panel

                  ],
                ),
              ),


            )


        );
      }),
    );
  }
}

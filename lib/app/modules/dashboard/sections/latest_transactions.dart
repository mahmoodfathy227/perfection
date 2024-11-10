import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:intl/intl.dart' as intl;
import 'package:perfection/app/modules/dashboard/widgets/user_details.dart';
import 'package:perfection/app/modules/home/controllers/home_controller.dart';

import '../data/mock_data.dart';
import '../responsive.dart';
import '../styles/styles.dart';
import '../widgets/category_box.dart';
import '../widgets/currency_text.dart';

class LatestTransactions extends StatelessWidget {
  LatestTransactions({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Obx(() {
      return CategoryBox(
        title: "All Users",
        suffix: TextButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Styles.defaultRedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            Get.to(() => UserDetailsPage(user: homeController.users.value.first, isAll: true,));
          },
        ),
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: homeController.users.value == null
                  ? 0
                  : homeController.users.value.length,
              itemBuilder: (context, index) {
                // var data = MockData.transactions[index];
                var data = homeController.users.value[index];

                return GestureDetector(
                  onTap: (){
                    Get.to(() => UserDetailsPage(user: homeController.users[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Hero(
                                    tag: "img${data.id}",
                                    child: CircleAvatar(
                                      backgroundImage:
                                      NetworkImage(data.avatar ?? ""),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.map,
                                      size: 12,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  "${data.firstName ?? ""} ${data.lastName ??
                                      ""}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            data.email ?? "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Visibility(
                          visible: !Responsive.isMobile(context),
                          child: Expanded(
                            child: Text(
                              "ID: ${data.id}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CurrencyText(
                              fontSize: 16,
                              currency: "",
                              amount: data.id ?? 0,

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

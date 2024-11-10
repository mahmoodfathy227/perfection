import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:perfection/app/data/models/user_model.dart';

import '../../../data/services/api_service.dart';


class HomeController extends GetxController with SingleGetTickerProviderMixin {
  // Observable state for animations
  late AnimationController controller;
  late AnimationController _fadecontroller;
  late AnimationController
      _controllerRotate; // This will stay as an AnimationController
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeInAnimation;
  late Animation<double> rotationAnimation;

  // Rotation angle to be controlled
  var rotationAngleCircule = 0.0.obs;

  // Create an observable to control rotation state
  var isRotatingForward = false.obs;

  // Make PageController observable
  var pageController = PageController(viewportFraction: 0.8).obs;

  // Track the current page index
  var currentPage = 0.obs;
  final DioClient _dioClient = DioClient();

var users = <Data>[].obs;

var totalUsers = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();

  }

  @override
  void onReady() {
    super.onReady();

  }


  var isLoading = false.obs;

  Future<void> fetchHomePageData() async {
    isLoading.value = true;
    try {
      int page = 1;
      int totalPages = 1;
      List<Data> allUsers = [];

      while (page <= totalPages) {
        var response = await _dioClient.get('/users?page=$page');

        if (response.statusCode == 200) {
          totalUsers.value = response.data['total'];
          var data = response.data;
          totalPages = data['total_pages'];
          allUsers.addAll((data['data'] as List).map((json) => Data.fromJson(json)).toList());
          page++;
        } else {
          // Handle error response
          isLoading.value = false;
          Get.snackbar("Error", "Failed to fetch home page data", colorText: Colors.white);
          return;
        }
      }

      // Handle success response
      users.value = allUsers;
      print("users gotten successfully: ${users.value}");
      isLoading.value = false;
    } catch (e) {
      print('Error in the home users getter: $e');
      Get.snackbar("Error", "Failed to fetch home page data", colorText: Colors.white);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }






  @override
  void onClose() {
    controller.dispose();
    _fadecontroller.dispose();
    _controllerRotate.dispose();

    pageController.value.dispose();
    super.onClose();
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:perfection/app/data/reusables/app_bar.dart';
import 'package:perfection/app/modules/dashboard/dashboard.dart';

import '../../../data/models/user_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
 {


  final List<Data> users = [
    Data(
        id: 1,
        firstName: 'Alice',
        lastName: 'Johnson',
        avatar: 'https://via.placeholder.com/150'),
    Data(
        id: 2,
        firstName: 'Bob',
        lastName: 'Smith',
        avatar: 'https://via.placeholder.com/150'),
    // Add more users here
  ];



  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}

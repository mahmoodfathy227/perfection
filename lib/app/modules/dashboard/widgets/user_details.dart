import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfection/app/modules/home/controllers/home_controller.dart';

import '../../../data/models/user_model.dart';


class UserDetailsPage extends StatelessWidget {
  final Data user;
  final bool isAll;

  UserDetailsPage({required this.user, this.isAll = false});
HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            isAll?
                "All Users" :
            '${user.firstName} ${user.lastName}'),
      ),
      body:

      isAll?
          ListView.builder(
            shrinkWrap: true,
            itemCount: homeController.users.length,

            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(padding: EdgeInsets.all(8.0),
                child: _buildUserDetails(homeController.users[index]),

                ),
              );
            },
          )


      :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _buildUserDetails(user),
      ),
    );
  }

  _buildUserDetails(Data user) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: "img${user.id}",
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatar ?? ""),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ID: ${user.id}',
                style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
              ),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.email, color: Colors.deepPurple),
                title: Text(
                  'Email',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
                ),
                subtitle: Text(
                  '${user.email}', // Replace with actual email
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.deepPurple),
                title: Text(
                  'Phone',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
                ),
                subtitle: Text(
                  '+123 456 7890', // Replace with actual phone number
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.deepPurple),
                title: Text(
                  'Location',
                  style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
                ),
                subtitle: Text(
                  'Cairo, Egypt', // Replace with actual location
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

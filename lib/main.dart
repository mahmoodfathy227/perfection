import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/modules/dashboard/responsive.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() {

  runApp(

    ScreenUtilInit(
      designSize: const Size(360, 690),

      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp, fontFamily: 'circularStd'),

          ),
          home: child,
        );
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Perfection",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),

  );
}

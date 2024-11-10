import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:perfection/app/modules/home/views/home_screen.dart';
import 'package:svg_flutter/svg.dart';



import '../../../data/constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../../dashboard/styles/styles.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      Future.microtask(() => Get.off(HomeView())); }
    else {
      // Future.microtask(() => Get.toNamed(AppPages.routes.mobilePage));
      null;
    }
    return Scaffold(

      backgroundColor: Styles.defaultPrimaryColor,
      body: Obx(() {
        print('${controller.previousPage.value}test 1');
        return controller.currentPage.value == 3
            ? GestureDetector(
                onTap: () {
                  // controller.restartOnboarding();
                  controller.navigateToLogin();
                },
                child: buildWelcomeScreen(context))
            : Stack(
                children: [
                  // Background Image Fade and Scale Transition
                  Obx(() {
                    return Stack(
                      children: [
                        if (controller.previousPage.value >= 0)
                          FadeTransition(
                            opacity: controller.backgroundFadeAnimation!,
                            child: ScaleTransition(
                              scale: controller.backgroundScaleAnimation!,
                              child: Image.asset(
                                "assets/images/onboarding/intro1.jpg",
                                fit: BoxFit.fill,

                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        // Fade and Scale for current background
                        ScaleTransition(
                          scale: controller.backgroundScaleAnimation!,
                          child: Image.asset(
                            "assets/images/onboarding/intro1.jpg",
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ],
                    );
                  }),

                  // PageView for Onboarding Pages
                  PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,

                    children: [
                      buildOnboardingPage(
                          "assets/images/onboarding/onboarding1.png", context , 1),
                      buildOnboardingPage(
                          "assets/images/onboarding/onboarding2.json", context, 2),
                      buildOnboardingPage(
                          "assets/images/onboarding/onboarding3.json", context, 3),
                    ],
                  ),

                  // Title and Description (Dynamic)
                  Obx(() {
                    String title = getTitle(controller.currentPage.value);
                    String description =
                        getDescription(controller.currentPage.value);

                    return Positioned(
                      top: 500.h,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: FadeTransition(
                            opacity: controller
                                .textFadeAnimation!, // استخدام الفيد التدريجي للنص
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SlideTransition(
                                  position: controller.titleSlideAnimation!,
                                  child: Text(
                                    title,
                                    style: primaryTextStyle(
                                      color: Colors.white,
                                      size: 18.sp.round(),
                                      weight: FontWeight.normal,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 90.h),
                                SlideTransition(
                                  position: controller.descSlideAnimation!,
                                  child: SizedBox(
                                    width: 300.w,
                                    child: Center(
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.center,
                                        style: primaryTextStyle(
                                          color: Colors.white,
                                          size: 12.sp.round(),
                                          weight: FontWeight.normal,
                                          height: 1.64,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  }),

                  // Navigation buttons (Skip, Next, Dots)
                  buildNavigationControls(),


                ],
              );
      }),
    );
  }

  // Helper function to return the title based on the current page
  String getTitle(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Welcome To Perfection";
      case 1:
        return "Made For Perfection Company";
      case 2:
        return "Get Started";
      default:
        return "";
    }
  }

  // Helper function to return the description based on the current page
  String getDescription(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "A Superior Leading Tech Company in The Middle Ease";
      case 1:
        return "This is A Demo Project of Dashboard Of Users made for Perfection Company";
      case 2:
        return "Start Viewing The Users And Details about them too "
            "@Mahmood-Fathy"
        ;
      default:
        return "";
    }
  }

  // Helper function to build the final welcome screen
  Widget buildWelcomeScreen(BuildContext context) {
    return Stack(children: [

      Padding(
        padding:  EdgeInsets.only(bottom: 70.h),
        child: Lottie.asset("assets/images/onboarding/background.json",
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
        ),
      ),

      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // Logo Animation: Fade-in + Scale-in
              FadeTransition(
                opacity: controller.fadeWelcomeAnimation!,
                child: ScaleTransition(
                  scale: controller.scaleWelcomeAnimation!,
                  child:
                  Image.asset(
                    "assets/images/onboarding/onboarding1.png",
    width: 100.w,
                    color: Colors.white,
                  )


                ),
              ),
            ],
          ))),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: controller.slideUpAnimation!,
            child: Container(
              width: 390.w,
              height: 282.h,
              child: Stack(
                children: [
                  // The blurred background using BackdropFilter
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ), // The same rounded corner as the container
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                      child: Container(
                        color: Colors
                            .transparent, // You can adjust transparency here if needed
                      ),
                    ),
                  ),

                  // The main content container with shadows and rounded corners
                  Container(
                    width: 390.w,
                    height: 282.h,
                    decoration: ShapeDecoration(
                      color: Color(0x33320060), // The semi-transparent color
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Color(0xFFE7CFFF)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            // Outer shadow (drop shadow)
                            Text(
                              'Get Started!',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                size: 48.sp.round(),
                                weight: FontWeight.w700,
                                color: Colors.white.withOpacity(1),
                                letterSpacing: -1.20,
                                shadows: [
                                  // Shadow 1: light shadow
                                  Shadow(
                                    offset: Offset(2, 2), // اتجاه الظل
                                    blurRadius: 4, // درجة التمويه
                                    color: Colors.black
                                        .withOpacity(0.15), // لون الظل الخفيف
                                  ),
                                  // Shadow 2: medium shadow
                                  Shadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 8,
                                    color: Colors.black
                                        .withOpacity(0.10), // لون الظل المتوسط
                                  ),
                                  // Shadow 3: strong shadow
                                  Shadow(
                                    offset: Offset(6, 6),
                                    blurRadius: 12,
                                    color: Colors.black
                                        .withOpacity(0.05), // لون الظل الأقوى
                                  ),
                                ],
                              ),
                            ),
                            // Inner shadow using Gradient
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [
                                    Colors.black
                                        .withOpacity(0.2), // يبدأ بلون داكن
                                    Colors.transparent, // تدريجيًا إلى الشفافية
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Text(
                                'Get Started!',
                                textAlign: TextAlign.center,
                                style: primaryTextStyle(
                                  size: 48.sp.round(),
                                  weight: FontWeight.w700,
                                  color: Colors
                                      .white, // Main text color (can be changed or omitted)
                                  letterSpacing: -1.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 187.w,
                          child: Text(
                            'Start Viewing The Users And Their Details',
                            textAlign: TextAlign.center,
                            style: primaryTextStyle(
                              color: Colors.white,
                              size: 13.sp.round(),
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 38.h),
                        Container(
                          width: 336.77.w,
                          height: 50.87.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.52.w, vertical: 11.43.w),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, 0.04),
                              end: Alignment(-1, -0.04),
                              colors: [
                                Color(0xFF20003D),
                                Color(0xFF6900CC),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(12.47),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x66000000),
                                blurRadius: 20.79,
                                offset: Offset(0, 9.35),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 16.63.sp.round(),
                                  weight: FontWeight.w500,
                                  height: 0.10,
                                  letterSpacing: -0.52,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
    ]);
  }

  // Helper function to build each onboarding page with a center image
  Widget buildOnboardingPage(String centerImagePath, BuildContext context, int index) {
    return Stack(
      children: [
        Obx(() {
          return PositionedDirectional(
            top: controller.currentPage.value == 1 ? 140.h : 160.h,
            start: controller.currentPage.value >= 0 ? 10.w : 0,
            end: controller.currentPage.value == 1 ? 10.w : 0,
            child: ScaleTransition(
              scale: controller.backgroundScaleAnimation!,
              child: RotationTransition(
                turns: controller
                    .imageRotationAnimation!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: RotationTransition(
                  turns: controller
                      .imageRotationAnimation!,
                child:
                index==1 ?
                Image.asset(
                  centerImagePath,
                  height: 230.h,
color: Colors.white,

                )
                  :
                    Lottie.asset(
                      centerImagePath,
                      height: 230.h,
                    )

                  ,
              ),
            ),
          )) );
        }),
      ],
    );
  }

  // Dots indicator for the bottom of the page
  Widget buildDots(OnboardingController controller) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: controller.currentPage.value == index ? 24.9.w : 6.2.w,
            height: 6.2.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.9),
              color: controller.currentPage.value == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.2),
            ),
          );
        }),
      );
    });
  }

  // Navigation controls for Skip, Next, and Dots
  Widget buildNavigationControls() {
    return Positioned(
      bottom: 80.h,
      left: 20.w,
      right: 20.w,
      child: Obx(() {
        return AnimatedOpacity(
          opacity: controller.currentPage.value == 3 ? 0 : 1,
          duration: Duration(milliseconds: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: controller.skip,
                child: Text(
                  "Skip",
                  style: primaryTextStyle(
                    color: Colors.white,
                    size: 14.5.sp.round(),
                    weight: FontWeight.normal,
                  ),
                ),
              ),
              buildDots(controller),
              GestureDetector(
                onTap: () {
                  controller.nextPage();
                  HapticFeedback.selectionClick();
                },
                child: SvgPicture.asset(
                  'assets/images/onboarding/next.svg',
                  width: 42.w,
                  height: 47.h,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

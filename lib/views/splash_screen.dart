import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/icons.dart';
import 'package:wallify/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<SlideActionState> _key =
      GlobalKey(); // Key to handle SlideAction state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homescreen,
      body: Stack(
        children: [
          // Logo and title
          Positioned(
            top: 70.h,
            left: 10.w,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.flowerlogo,
                  height: 35.h,
                  width: 35.w,
                ),
                SizedBox(width: 5.w),
                Text(
                  'Wallify',
                  style: TextStyle(
                    color: AppColors.textfieldheading,
                    fontSize: 20.sp,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Text content
          Positioned(
            top: 120.h,
            left: 10.w,
            right: 10.w,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 28.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  letterSpacing: 1.2,
                ),
                children: const [
                  TextSpan(
                    text: "Uncover Gorgeous ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Wallpapers to Suit Every ",
                    style: TextStyle(color: AppColors.buttoncolor),
                  ),
                  TextSpan(
                    text: "Mood and Style",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 260.h,
            left: 10.w,
            right: 10.w,
            child: Text(
              'Transform your device with high-quality, curated wallpapers. Unleash your creativity and personalize your screen like never before.',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 13.sp,
                fontFamily: 'Raleway',
              ),
            ),
          ),
          Positioned(
            top: 350.h,
            left: 40.w,
            right: 40.w,
            child: Container(
              height: 400.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),
                child: Image.asset(
                  AppImage.splash3,
                  fit: BoxFit.cover,
                  height: 400.h,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 450.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 350.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.overlay,
                  ),
                  child: Image.asset(
                    AppImage.splash2,
                    fit: BoxFit.cover,
                    height: 400.h,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 50.h,
            left: 20.w,
            right: 20.w,
            child: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    textColor: Colors.white,
                    innerColor: Colors.white,
                    outerColor: Colors.transparent,
                    sliderButtonIcon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.buttoncolor,
                    ),
                    key: _key,
                    onSubmit: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Swipe To Explore Now"),
                        ),
                      );

                      Future.delayed(
                        const Duration(seconds: 2),
                        () => _key.currentState!.reset(),
                      );
                      return null;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

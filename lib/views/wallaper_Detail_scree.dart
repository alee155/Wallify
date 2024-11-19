import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/icons.dart';

class WallpaperDetails extends StatefulWidget {
  final String image;
  final String name;
  final String rating;

  const WallpaperDetails(
      {super.key,
      required this.image,
      required this.name,
      required this.rating});

  @override
  State<WallpaperDetails> createState() => _WallpaperDetailsState();
}

class _WallpaperDetailsState extends State<WallpaperDetails> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: Colors.black.withOpacity(0.8),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Set Wallpaper As',
                style: TextStyle(
                  color: AppColors.whitecolor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.home,
                  height: 30.h,
                  width: 30.w,
                  color: AppColors.whitecolor,
                ),
                title: Text(
                  'Home Screen',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white.withOpacity(0.5)),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.lock,
                  height: 30.h,
                  width: 30.w,
                  color: AppColors.whitecolor,
                ),
                title: Text(
                  'Lock Screen',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white.withOpacity(0.5)),
              ListTile(
                leading: SvgPicture.asset(
                  AppIcons.both,
                  height: 30.h,
                  width: 30.w,
                  color: AppColors.whitecolor,
                ),
                title: Text(
                  'Both Screens',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Logic to set wallpaper as both screens
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),

          // Top bar with name and back button
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 100.h,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: AppColors.whitecolor,
                          fontSize: 20.sp,
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          AppIcons.back,
                          height: 35.h,
                          width: 35.w,
                          color: AppColors.whitecolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 17.sp),
                      Text(widget.rating, // Display rating from passed data
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Set wallpaper button
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: GestureDetector(
              onTap: () => _showBottomSheet(context),
              child: Container(
                height: 50.h,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Set Wallpaper',
                    style: TextStyle(
                      color: AppColors.whitecolor,
                      fontSize: 20.sp,
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

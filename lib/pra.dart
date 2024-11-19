import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/icons.dart';
import 'package:wallify/utils/images.dart';
import 'package:wallify/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homescreen,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Text(
              'Welcome,',
              style: TextStyle(
                color: AppColors.textfieldheading,
                fontSize: 15.sp,
                fontFamily: 'Kodchasan',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Muhammad Ali',
                  style: TextStyle(
                    color: AppColors.darkblack,
                    fontSize: 20.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SvgPicture.asset(
                  AppIcons.user,
                  height: 30.h,
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const SearchBarWidget(),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: AppColors.buttoncolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundImage: const AssetImage(AppImage.tab1),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Waterfalls',
                            style: TextStyle(
                              color: AppColors.darkblack,
                              fontSize: 13.sp,
                              fontFamily: 'Kodchasan',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: AppColors.buttoncolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundImage: const AssetImage(AppImage.tab2),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Rivers',
                            style: TextStyle(
                              color: AppColors.darkblack,
                              fontSize: 13.sp,
                              fontFamily: 'Kodchasan',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: AppColors.buttoncolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundImage: const AssetImage(AppImage.tab3),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Mountains',
                            style: TextStyle(
                              color: AppColors.darkblack,
                              fontSize: 13.sp,
                              fontFamily: 'Kodchasan',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

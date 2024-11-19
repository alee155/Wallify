import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/data_list.dart';
import 'package:wallify/utils/icons.dart';
import 'package:wallify/utils/images.dart';
import 'package:wallify/views/viewall.dart';
import 'package:wallify/views/wallaper_Detail_scree.dart';
import 'package:wallify/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => buildItem(context, items[index]),
          ),
        ),
      ],
    );
  }

  Widget buildItem(BuildContext context, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to WallpaperDetails and pass the item data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WallpaperDetails(
                image: item['image'],
                name: item['name'],
                rating: item['rating'],
              ),
            ),
          );
        },
        child: Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColors.buttoncolor,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 5.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'],
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 14.sp),
                          Text(item['rating'],
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homescreen,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.h),
              Text('Welcome,',
                  style: TextStyle(
                      color: AppColors.textfieldheading,
                      fontSize: 15.sp,
                      fontFamily: 'Kodchasan')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Muhammad Ali',
                      style: TextStyle(
                          color: AppColors.darkblack,
                          fontSize: 20.sp,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold)),
                  SvgPicture.asset(AppIcons.user, height: 30.h, width: 30.w),
                ],
              ),
              SizedBox(height: 20.h),
              const SearchBarWidget(),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryTab('View All', AppImage.splash2, context),
                    SizedBox(width: 10.w),
                    _buildCategoryTab('Waterfalls', AppImage.tab1, context),
                    SizedBox(width: 10.w),
                    _buildCategoryTab('Mountains', AppImage.tab3, context),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              buildSection('Waterfalls', waterfalls),
              buildSection('Rivers', rivers),
              buildSection('Mountains', mountains),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(
      String title, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'View All') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ViewAll(),
            ),
          );
        } else {
          // Handle tap for other categories
          print('Tapped on $title');
        }
      },
      child: Container(
        height: 50.h,
        width: 140.w,
        decoration: BoxDecoration(
          color: AppColors.darkblack,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 20.r, backgroundImage: AssetImage(imagePath)),
              SizedBox(width: 5.w),
              Text(
                title,
                style: TextStyle(
                    color: AppColors.whitecolor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kodchasan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                color: AppColors.darkblack,
                fontSize: 20.sp,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
        Text('See all',
            style: TextStyle(
                color: AppColors.buttoncolor,
                fontSize: 15.sp,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/icons.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.darkblack),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset(
              AppIcons.find,
              height: 20.h,
              width: 20.w,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find wallpaper of your choice",
                hintStyle: TextStyle(
                  color: AppColors.textfieldheading,
                  fontSize: 14.sp,
                  fontFamily: 'Kodchasan',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

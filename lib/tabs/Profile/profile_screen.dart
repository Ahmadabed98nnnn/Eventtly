import 'package:evently/app_theme.dart';
import 'package:evently/tabs/Profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 55),
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
            ),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset('assets/images/Exit.svg'),
                SizedBox(width: 4.w),
                Text(
                  'Logout',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 110.h),
      ],
    );
  }
}

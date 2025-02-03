import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Image.asset(
              'assets/images/Route_Logo.png',
              height: 124.h,
              width: 124.w,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Safwat',
                    style: textTheme.displayMedium,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'johnsafwat.route@gmail.com',
                    style: textTheme.bodyLarge?.copyWith(color: AppTheme.white),
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

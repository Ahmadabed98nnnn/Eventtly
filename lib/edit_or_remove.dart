import 'package:evently/models/event.dart';
import 'package:evently/models/event_provider.dart';
import 'package:evently/update_event.dart';
import 'package:flutter/material.dart';
import 'package:evently/models/category.dart';
import 'package:evently/tabs/Home/event_item.dart';
import 'package:evently/tabs/Home/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:provider/provider.dart';

class EditOrRemove extends StatelessWidget {
  const EditOrRemove({required this.event, super.key});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60.w),
            Text(
              'Event Details',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff5669FF),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UpdateEvent(
                      event: event,
                    ),
                  ),
                );
              },
              child: SvgPicture.asset('assets/images/Edit.svg'),
            ),
            SizedBox(width: 12.w),
            InkWell(
              onTap: () {
                FirebaseService.deleteEvents(event).then((_) {
                  Provider.of<EventProvider>(context, listen: false)
                      .getEvents();
                  Navigator.of(context).pop();
                });
              },
              child: SvgPicture.asset('assets/images/delete.svg'),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                'assets/images/${event.category.imageName}.png',
                height: 210.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              event.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff5669FF),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 64.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color: Color(0xff5669FF),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                color: Color(0xff5669FF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                              ),
                              width: 48.w,
                              height: 48.h,
                              child: SvgPicture.asset(
                                'assets/images/Calendar_Days.svg',
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.h),
                              Text(
                                DateFormat('dd MMMM yyyy').format(event.date),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5669FF),
                                ),
                              ),
                              Text(
                                DateFormat('hh:mm a').format(event.date),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 64.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color: Color(0xff5669FF),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                color: Color(0xff5669FF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                              ),
                              width: 48.w,
                              height: 48.h,
                              child: SvgPicture.asset(
                                'assets/images/gps.svg',
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                          Text(
                            'Cairo , Egypt',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5669FF),
                            ),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/images/Next.svg',
                            color: Color(0xff5669FF),
                          ),
                          SizedBox(width: 6.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      height: 330.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color: Color(0xff5669FF),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                        child: Image.asset(
                          'assets/images/map.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      event.description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

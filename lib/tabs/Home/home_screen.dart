import 'package:evently/app_theme.dart';
import 'package:evently/models/category.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/event_provider.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:evently/models/settings_provider.dart';
import 'package:evently/tabs/Home/event_item.dart';
import 'package:evently/tabs/Home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    if (eventProvider.event.isEmpty) {
      eventProvider.getEvents();
    }
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 170.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: settingsProvider.isDark
                ? AppTheme.backgroundDark
                : AppTheme.primary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24.r),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Welcome Back ✨',
                    style: textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'John Safwat',
                    style: textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 16.h),
                DefaultTabController(
                  length: Category.categories.length,
                  child: TabBar(
                    padding: EdgeInsets.only(left: 8.w),
                    labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    onTap: (index) {
                      _currentIndex = index;
                      eventProvider.filterEvents(
                        Category.categories[index],
                      );
                      setState(() {});
                    },
                    tabs: Category.categories
                        .map(
                          (category) => TabItem(
                            category: category,
                            isSelected: _currentIndex ==
                                Category.categories.indexOf(category),
                            selectedBackground: settingsProvider.isDark
                                ? AppTheme.primary
                                : Color(0xffFFFFFF),
                            selectedForeground: settingsProvider.isDark
                                ? AppTheme.white
                                : Color(0xff5669FF),
                            unSelectedForeground: settingsProvider.isDark
                                ? AppTheme.primary
                                : Color(0xffFFFFFF),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
            itemBuilder: (_, index) => Padding(
              padding: index == eventProvider.event.length - 1
                  ? EdgeInsets.only(bottom: 75.h)
                  : EdgeInsets.all(0),
              child: EventItem(
                event: eventProvider.event[index],
              ),
            ),
            itemCount: eventProvider.event.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
          ),
        ),
      ],
    );
  }
}

import 'package:evently/app_theme.dart';
import 'package:evently/models/settings_provider.dart';
import 'package:evently/tabs/Profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'Arabic'),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeader(),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Language',
                style: textheme.titleLarge!.copyWith(
                    color: settingsProvider.isDark
                        ? AppTheme.white
                        : AppTheme.black),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.primary,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
                child: DropdownButton(
                  value: settingsProvider.languageCode,
                  items: languages
                      .map(
                        (language) => DropdownMenuItem(
                          value: language.code,
                          child: Text(
                            language.name,
                            style: textheme.titleLarge!.copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) async {
                    if (value != null) {
                      settingsProvider.changeLang(value);
                      SharedPreferences sharePrefs =
                          await SharedPreferences.getInstance();
                      sharePrefs.setString('lang', value);
                    }
                  },
                  underline: SizedBox(),
                  iconEnabledColor: AppTheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Dark Theme',
                style: textheme.titleLarge!.copyWith(
                    color: settingsProvider.isDark
                        ? AppTheme.white
                        : AppTheme.black),
              ),
              Spacer(),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (value) async {
                  settingsProvider
                      .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
                  SharedPreferences sharePrefs =
                      await SharedPreferences.getInstance();
                  sharePrefs.setBool('dark', value);
                },
              ),
            ],
          ),
        ),
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

class Language {
  String code;
  String name;

  Language({required this.code, required this.name});
}

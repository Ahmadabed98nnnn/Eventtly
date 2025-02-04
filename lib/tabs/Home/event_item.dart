import 'package:evently/app_theme.dart';
import 'package:evently/edit_or_remove.dart';
import 'package:evently/models/category.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventItem({required this.event});
  Event event;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditOrRemove(
              event: event,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                settingsProvider.isDark
                    ? 'assets/images/${event.category.imageName}_dark.png'
                    : 'assets/images/${event.category.imageName}.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.backgroundDark
                  : AppTheme.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  DateFormat('dd').format(event.date),
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  DateFormat('MMM').format(event.date),
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 360,
              height: 55,
              decoration: BoxDecoration(
                color: settingsProvider.isDark
                    ? AppTheme.backgroundDark
                    : AppTheme.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      event.description,
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: settingsProvider.isDark
                            ? AppTheme.white
                            : AppTheme.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

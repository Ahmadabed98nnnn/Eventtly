import 'package:evently/models/category.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/event_provider.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:evently/tabs/Home/event_item.dart';
import 'package:evently/tabs/Home/tab_item.dart';
import 'package:flutter/material.dart';
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

    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff5669FF),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Welcome Back ✨',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'John Safwat',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF)),
                  ),
                ),
                SizedBox(height: 16),
                DefaultTabController(
                  length: Category.categories.length,
                  child: TabBar(
                      padding: EdgeInsets.only(left: 8),
                      labelPadding: EdgeInsets.symmetric(horizontal: 4),
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
                              selectedBackground: Color(0xffFFFFFF),
                              selectedForeground: Color(0xff5669FF),
                              unSelectedForeground: Color(0xffFFFFFF),
                            ),
                          )
                          .toList()),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            itemBuilder: (_, index) => Padding(
              padding: index == eventProvider.event.length - 1
                  ? EdgeInsets.only(bottom: 75)
                  : EdgeInsets.all(0),
              child: EventItem(
                event: eventProvider.event[index],
              ),
            ),
            itemCount: eventProvider.event.length,
            separatorBuilder: (_, __) => SizedBox(height: 16),
          ),
        ),
      ],
    );
  }
}

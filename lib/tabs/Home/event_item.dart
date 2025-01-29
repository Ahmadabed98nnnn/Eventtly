import 'package:evently/models/category.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventItem({required this.event});
  Event event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 400,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/${event.category.imageName}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                DateFormat('dd').format(event.date),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5669FF),
                ),
              ),
              SizedBox(height: 4),
              Text(
                DateFormat('MMM').format(event.date),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5669FF),
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
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Meeting for Updating The Development Method',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1C1C1C),
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
    );
  }
}

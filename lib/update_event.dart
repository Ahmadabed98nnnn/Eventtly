import 'package:evently/home.dart';
import 'package:evently/home.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/event_provider.dart';
import 'package:evently/tabs/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:evently/models/category.dart';
import 'package:evently/tabs/Home/event_item.dart';
import 'package:evently/tabs/Home/tab_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:provider/provider.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({required this.event, super.key});
  final Event event;
  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late Category selectedCategory;
  DateTime? selectedDate;
  DateFormat dateformat = DateFormat('d/M/yyyy');
  TimeOfDay? selectedTime;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = int.parse(widget.event.category.id) - 1;
  }

  @override
  Widget build(BuildContext context) {
    selectedCategory = Category.categories[currentIndex + 1];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 75.w),
            Text(
              'Edit Event',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff5669FF),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                'assets/images/${selectedCategory.imageName}.png',
                height: 210.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          DefaultTabController(
            length: Category.categories.length - 1,
            child: TabBar(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                tabs: Category.categories
                    .skip(1)
                    .map(
                      (category) => TabItem(
                        category: category,
                        isSelected: currentIndex + 1 ==
                            Category.categories.indexOf(category),
                        selectedBackground: Color(0xff5669FF),
                        selectedForeground: Color(0xffFFFFFF),
                        unSelectedForeground: Color(0xff5669FF),
                      ),
                    )
                    .toList()),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "We Are Going To Play Football",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(
                            'assets/images/Note_Edit.svg',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title can not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "We Are Going To Play Football",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description can not be empty';
                        }
                        return null;
                      },
                      maxLines: 4,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Calendar_Days.svg',
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Event Date',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1C1C1C),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                Duration(days: 365),
                              ),
                              initialDate: selectedDate,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                            );
                            if (date != null) {
                              selectedDate = date;
                            }
                            setState(() {});
                          },
                          child: Text(
                            selectedDate == null
                                ? 'Choose Date'
                                : dateformat.format(selectedDate!),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5669FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Clock.svg',
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Event Time',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1C1C1C),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              selectedTime = time;
                            }
                            setState(() {});
                          },
                          child: Text(
                            selectedTime == null
                                ? 'Choose Time'
                                : selectedTime!.format(context),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5669FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: createEvent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5669FF),
                        minimumSize: Size(double.infinity, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        "Update Event",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white, // White text color
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void createEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      Event event = Event(
        id: widget.event.id,
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        date: dateTime,
      );
      FirebaseService.updateEvents(event).then((_) {
        Provider.of<EventProvider>(context, listen: false).getEvents();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      }).catchError((error) {
        print(error);
      });
    }
  }
}

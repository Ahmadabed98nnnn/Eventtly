import 'package:evently/models/event.dart';
import 'package:evently/models/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:evently/models/category.dart';
import 'package:evently/tabs/Home/event_item.dart';
import 'package:evently/tabs/Home/tab_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int _currentIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Category selectedCategory = Category.categories.first;
  DateTime? selectedDate;
  DateFormat dateformat = DateFormat('d/M/yyyy');
  TimeOfDay? selectedTime;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    selectedCategory = Category.categories[_currentIndex + 1];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Event',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff5669FF),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/${selectedCategory.imageName}.png',
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
          ),
          DefaultTabController(
            length: Category.categories.length - 1,
            child: TabBar(
                padding: EdgeInsets.only(left: 16, right: 16),
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  _currentIndex = index;
                  setState(() {});
                },
                tabs: Category.categories
                    .skip(1)
                    .map(
                      (category) => TabItem(
                        category: category,
                        isSelected: _currentIndex + 1 ==
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
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "We Are Going To Play Football",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/images/Note_Edit.svg',
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title can not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1C1C1C),
                      ),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "We Are Going To Play Football",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
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
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Calendar_Days.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Event Date',
                          style: TextStyle(
                            fontSize: 16,
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
                              fontSize: 16,
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
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Event Time',
                          style: TextStyle(
                            fontSize: 16,
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5669FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: createEvent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5669FF), // Blue color
                        minimumSize:
                            Size(double.infinity, 50), // Full width & height 50
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Rounded corners
                        ),
                      ),
                      child: Text(
                        "Add Event",
                        style: TextStyle(
                          fontSize: 16,
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
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        date: dateTime,
      );
      FirebaseService.addEvent(event).then((_) {
        Provider.of<EventProvider>(context, listen: false).getEvents();
        Navigator.of(context).pop();
      }).catchError((error) {
        print(error);
      });
    }
  }
}

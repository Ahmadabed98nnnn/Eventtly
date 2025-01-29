import 'package:evently/models/category.dart';
import 'package:evently/models/event.dart';
import 'package:evently/models/firebase_services.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  List<Event> event = [];
  List<Event> filteredEvents = [];
  Category selectedCategory = Category.categories.first;
  Future<void> getEvents() async {
    event = await FirebaseService.getEvents(selectedCategory.id);
    // filterEvents(selectedCategory);
    notifyListeners();
  }

  filterEvents(Category category) {
    selectedCategory = category;
    // if (selectedCategory.id == '0') {
    //   filteredEvents = event;
    // } else {
    //   filteredEvents = event.where(
    //     (event) {
    //       return event.category.id == selectedCategory.id;
    //     },
    //   ).toList();
    // }
    getEvents();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category.dart';
import 'package:flutter/material.dart';

class Event {
  String id;
  Category category;
  String title;
  String description;
  DateTime date;

  Event({
    this.id = '',
    required this.category,
    required this.title,
    required this.date,
    required this.description,
  });

  Event.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          category: Category.categories.firstWhere(
            (element) => element.id == json['categoryId'],
          ),
          title: json['title'],
          description: json['description'],
          date: (json['datetime'] as Timestamp).toDate(),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': category.id,
      'title': title,
      'description': description,
      'datetime': Timestamp.fromDate(date),
    };
  }
}

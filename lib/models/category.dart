import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  IconData icon;
  String imageName;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });

  static List<Category> categories = [
    Category(
      id: '0',
      name: 'All',
      icon: Icons.explore_outlined,
      imageName: '',
    ),
    Category(
        id: '1',
        name: 'sports',
        icon: Icons.sports_basketball_outlined,
        imageName: 'Sports'),
    Category(
        id: '2',
        name: 'Birthday',
        icon: Icons.cake_outlined,
        imageName: 'Birthday'),
    Category(
        id: '3', name: 'Meeting', icon: Icons.laptop, imageName: 'Meeting'),
    Category(
        id: '4',
        name: 'Gaming',
        icon: Icons.gamepad_outlined,
        imageName: 'Gaming'),
    Category(
        id: '5',
        name: 'Eating',
        icon: Icons.food_bank_outlined,
        imageName: 'Eating'),
    Category(id: '6', name: 'Holiday', icon: Icons.abc, imageName: 'Holiday'),
    Category(
        id: '7',
        name: 'Exhibition',
        icon: Icons.punch_clock_outlined,
        imageName: 'Exhibition'),
    Category(
        id: '8',
        name: 'Workshop',
        icon: Icons.work_history_rounded,
        imageName: 'Workshop'),
    Category(
        id: '9',
        name: 'Book Club',
        icon: Icons.book_outlined,
        imageName: 'Bookclub'),
  ];
}

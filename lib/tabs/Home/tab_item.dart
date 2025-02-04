import 'package:evently/models/category.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  TabItem({
    required this.category,
    required this.isSelected,
    required this.selectedBackground,
    required this.selectedForeground,
    required this.unSelectedForeground,
  });
  Category category;
  bool isSelected;
  Color selectedBackground;
  Color selectedForeground;
  Color unSelectedForeground;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? selectedBackground : Colors.transparent,
        border: Border.all(
          width: 1,
          color: isSelected ? Colors.transparent : unSelectedForeground,
        ),
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? selectedForeground : unSelectedForeground,
          ),
          SizedBox(width: 8),
          Text(
            category.name,
            style: textTheme.bodyLarge!.copyWith(
              color: isSelected ? selectedForeground : unSelectedForeground,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/models/category_item.dart';

import '../models/item.dart';
void showAlert(String title ,String content , BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content:  Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}


List<Item> itemsByCategory(List<Item> items, CategoryItem category) {
  return items
      .where((element) => element.category?.name == category.name)
      .toList();
}
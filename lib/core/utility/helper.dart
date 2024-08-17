import 'package:flutter/material.dart';
import 'package:fresh_fruits/core/models/category_item.dart';

import '../models/item.dart';

void showTopSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.black, int durationSeconds = 3}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry; // Declare it first

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10, // Position it below the status bar
      left: 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => overlayEntry.remove(), // Now `overlayEntry` is correctly referenced
              ),
            ],
          ),
        ),
      ),
    ),
  );
  overlay.insert(overlayEntry);
  // Automatically remove the Snackbar after the specified duration
  Future.delayed(Duration(seconds: durationSeconds), () {
    overlayEntry.remove();
  });
}

void showAlert(String title, String content, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
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

String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'First name is required';
  } else if (value.length < 2) {
    return 'First name must be at least 2 characters long';
  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'First name can only contain alphabetic characters';
  }
  return null; // Return null if validation passes
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Last name is required';
  } else if (value.length < 2) {
    return 'Last name must be at least 2 characters long';
  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Last name can only contain alphabetic characters';
  }
  return null; // Return null if validation passes
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null; // Return null if validation passes
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null; // Return null if validation passes
}

// for fetching data by category
List<Item> itemsByCategory(List<Item> items, CategoryItem category) {
  return items
      .where((element) => element.category.name == category.name)
      .toList();
}

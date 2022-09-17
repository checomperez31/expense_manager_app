import 'package:flutter/material.dart';

class InputDecorationUtils {
  static InputDecoration getDefault({String? label, String? hint}) {
    return InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        hintText: hint
    );
  }
}
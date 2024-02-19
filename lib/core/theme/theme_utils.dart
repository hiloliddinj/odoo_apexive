// ignore_for_file: no_magic_number
import 'package:flutter/material.dart';

/// Widget Utils class contains all the common widgets that are used
/// in the application. This class is used to reduce the code duplication
/// and to make the code more readable and maintainable.
class ThemeUtils {
  /// The border of the form fields.
  static OutlineInputBorder formBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      primarySwatch: Colors.teal,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.tealAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red),
      ),
      
      );
}

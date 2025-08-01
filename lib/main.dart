import 'package:flutter/material.dart';
import 'package:flutter_renk_secici_app/pages/color_picker_page.dart';
import 'package:flutter_renk_secici_app/theme/app_theme.dart';

void main(List<String> asyc) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const ColorPickerPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_ui_flutter/bottonavbar.dart';

// https://www.youtube.com/watch?v=yB80QCuJco0&t=202s
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
    );
  }
}

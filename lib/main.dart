import 'package:flutter/material.dart';
import 'package:kntina_app/food_list_page.dart';
import 'package:kntina_app/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:HomePage());
  }
}

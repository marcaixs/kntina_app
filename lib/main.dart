import 'package:flutter/material.dart';
import 'package:kntina_app/features/auth/presentation/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:LoginPage());
  }
}

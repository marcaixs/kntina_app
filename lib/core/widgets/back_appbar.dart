import 'package:flutter/material.dart';

class BackAppbar extends StatelessWidget {
  final String title;
  const BackAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
       leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
        centerTitle: false,
    );
  }
}
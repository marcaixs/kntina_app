import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){onPressed();} ,
    style: ElevatedButton.styleFrom(
              minimumSize: Size(250, 40),
              backgroundColor: const Color.fromARGB(255, 14, 60, 28),
              
            ), child: Text(text, style: TextStyle(color: Colors.white),),);
  }
}
import 'package:flutter/material.dart';

class BigTemp extends StatelessWidget {
  final int tempInFarenheit;
  const BigTemp(this.tempInFarenheit, {super.key}); // Constructor
  @override
  Widget build(BuildContext context) {
    // Retursn a widget or widget tree that shows the temperature in big text
    // We want to display the current temperature in 36 point, bold text. 

    // Constructor for BigTemp and implement its build method.
    return Center(
      child: Text(
        '${tempInFarenheit.toString()}°F',
        // Display the current temperature in 36 point, bold text
        style: TextStyle(
          fontSize: 36, // Large font size for big display
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );

  }
}

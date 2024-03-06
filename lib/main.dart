import 'package:flutter/material.dart';
import 'package:stepsapp/step_form.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step App',
      home: StepForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:calculator_app/provider/cal_provider.dart';
import 'package:calculator_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Calculator_App());
}

class Calculator_App extends StatelessWidget {
  const Calculator_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Homescreen(),
      ),
    );
  }
}

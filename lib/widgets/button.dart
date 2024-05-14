import 'package:calculator_app/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.label, this.textcolor = Colors.white});

  final String label;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CalculatorProvider>(context, listen: false).setValue(label);
      },
      child: Material(
        elevation: 3,
        color: AppColors.secondary2Color,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          radius: 36,
          backgroundColor: AppColors.secondary2Color,
          child: Text(
            label,
            style: TextStyle(
              color: textcolor,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

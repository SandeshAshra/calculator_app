import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider with ChangeNotifier {
  final compController = TextEditingController();

  void setValue(String value) {
    String str = compController.text.trim();

    switch (value) {
      case "<-":
        if (str.isNotEmpty) {
          compController.text = str.substring(0, str.length - 1);
        }
        break;
      case "AC":
        compController.clear();
        break;
      case "X":
        _handleOperator(str, '*');
        break;
      case "/":
        _handleOperator(str, '/');
        break;
      case "+":
        _handleOperator(str, '+');
        break;
      case "-":
        _handleOperator(str, '-');
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }

    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));
  }

  void _handleOperator(String str, String operator) {
    if (str.isNotEmpty && _isOperator(str[str.length - 1])) {
      // If the last character is already an operator, replace it with the new operator
      compController.text = str.substring(0, str.length - 1) + operator;
    } else {
      compController.text += operator;
    }
  }

  bool _isOperator(String value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
  }

  void compute() {
    String text = compController.text;
    try {
      compController.text = text.interpret().toString();
    } catch (e) {
      compController.text = 'Error';
    }
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}

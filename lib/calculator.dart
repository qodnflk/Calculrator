import 'package:calculator/circle_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  dynamic result;
  // nullable(?)를 붙인이유는 사용자가 값을 적지않으면 null값이 되기때문

  void numberTapped(int tappedNumber) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = tappedNumber;
      });
      return;
    }

    if (operator == null) {
      setState(() {
        firstOperand = int.parse("$firstOperand$tappedNumber");
      });
      return;
    }

    if (secondOperand == null) {
      setState(() {
        secondOperand = tappedNumber;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse("$secondOperand$tappedNumber");
    });
  }

  void clearNumber() {
    setState(() {
      firstOperand = null;
      operator = null;
      secondOperand = null;
      result = null;
      // null값으로 초기화됨
    });
  }

  void operatorTapped(String tappedOperator) {
    setState(() {
      operator = tappedOperator;
    });
  }

  String showText() {
    if (result != null) {
      return "$result";
    }

    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }

    if (operator != null) {
      return "$firstOperand$operator";
    }

    if (firstOperand != null) {
      return "$firstOperand";
    }
    return "0";
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) {
      return;
    }

    if (operator == "+") {
      plusNumber();
      return;
    }

    if (operator == "-") {
      minusNumber();
      return;
    }
    if (operator == "X") {
      multiplyNumber();
      return;
    }
    if (operator == "÷") {
      didveNumber();
      return;
    }
  }

  void plusNumber() {
    setState(() {
      result =
          firstOperand! + secondOperand!; // first,second가 null이면 안되기때문에 !붙임
    });
  }

  void minusNumber() {
    setState(() {
      result =
          firstOperand! - secondOperand!; // first,second가 null이면 안되기때문에 !붙임
    });
  }

  void multiplyNumber() {
    setState(() {
      result =
          firstOperand! * secondOperand!; // first,second가 null이면 안되기때문에 !붙임
    });
  }

  void didveNumber() {
    setState(() {
      result =
          firstOperand! / secondOperand!; // first,second가 null이면 안되기때문에 !붙임
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            showText(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleButton(padNumber: "7", onTap: () => numberTapped(7)),
                CircleButton(padNumber: "8", onTap: () => numberTapped(8)),
                CircleButton(padNumber: "9", onTap: () => numberTapped(9)),
                CircleButton(padNumber: "÷", onTap: () => operatorTapped("÷")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleButton(padNumber: "4", onTap: () => numberTapped(4)),
                CircleButton(padNumber: "5", onTap: () => numberTapped(5)),
                CircleButton(padNumber: "6", onTap: () => numberTapped(6)),
                CircleButton(padNumber: "X", onTap: () => operatorTapped("X")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleButton(padNumber: "1", onTap: () => numberTapped(1)),
                CircleButton(padNumber: "2", onTap: () => numberTapped(2)),
                CircleButton(padNumber: "3", onTap: () => numberTapped(3)),
                CircleButton(padNumber: "-", onTap: () => operatorTapped("-")),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleButton(
                  padNumber: "C",
                  onTap: clearNumber,
                  color: Colors.black,
                ),
                CircleButton(padNumber: "0", onTap: () => numberTapped(0)),
                CircleButton(
                    padNumber: "=",
                    onTap: calculateResult,
                    color: Colors.black),
                CircleButton(padNumber: "+", onTap: () => operatorTapped("+")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

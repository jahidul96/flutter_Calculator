// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:calculator/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var question = "";
var answer = "";

class _HomePageState extends State<HomePage> {
  List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "Ans",
    "=",
  ];

  dynamic tapButton(val) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 220, 220),
      body: Column(
        children: [
          // top part show result
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    question,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),

          // calculator buttons
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: ((context, index) {
                  // clear button
                  if (index == 0) {
                    return MyButton(
                      buttonText: buttons[index],
                      buttonColor: Colors.green,
                      textColor: Colors.white,
                      tap: () {
                        setState(() {
                          question = "";
                          answer = "";
                        });
                      },
                    );
                  }

                  // delete button
                  else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      buttonColor: Colors.red,
                      textColor: Colors.white,
                      tap: () {
                        setState(() {
                          question = question.substring(0, question.length - 1);
                        });
                      },
                    );
                  }
                  // equal button
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      tap: () {
                        setState(() {
                          equalResult();
                        });
                      },
                    );
                  }

                  // ans button
                  else if (index == buttons.length - 2) {
                    return MyButton(
                      buttonText: buttons[index],
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      tap: () {
                        setState(() {
                          equalResult();
                        });
                      },
                    );
                  }

                  // all other button
                  else {
                    return MyButton(
                      buttonText: buttons[index],
                      buttonColor: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.white,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                      tap: () {
                        setState(() {
                          question += buttons[index];
                        });
                      },
                    );
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  isOperator(String val) {
    if (val == "%" ||
        val == "/" ||
        val == "x" ||
        val == "-" ||
        val == "=" ||
        val == "+") {
      return true;
    }
    return false;
  }

  void equalResult() {
    String finalQuestion = question;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

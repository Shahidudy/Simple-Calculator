import 'package:cal1/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(userInput.toString(),
                          style: const TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(answer.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 253, 253, 253),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: "AC",
                        pressing: () {
                          userInput = "";
                          answer = "";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "~",
                        pressing: () {},
                      ),
                      MyButton(
                        title: "~",
                        pressing: () {},
                      ),
                      MyButton(
                        title: "/",
                        pressing: () {
                          userInput += "/";
                          setState(() {});
                        },
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "7",
                        pressing: () {
                          userInput += "7";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "8",
                        pressing: () {
                          userInput += "8";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "9",
                        pressing: () {
                          userInput += "9";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        pressing: () {
                          userInput += "x";
                          setState(() {});
                        },
                        title: "x",
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "4",
                        pressing: () {
                          setState(() {
                            userInput += "4";
                          });
                        },
                      ),
                      MyButton(
                        title: "5",
                        pressing: () {
                          setState(() {
                            userInput += "5";
                          });
                        },
                      ),
                      MyButton(
                        title: "6",
                        pressing: () {
                          setState(() {
                            userInput += "6";
                          });
                        },
                      ),
                      MyButton(
                        pressing: () {
                          setState(() {
                            userInput += "-";
                          });
                        },
                        title: "-",
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "1",
                        pressing: () {
                          setState(() {
                            userInput += "1";
                          });
                        },
                      ),
                      MyButton(
                        title: "2",
                        pressing: () {
                          setState(() {
                            userInput += "2";
                          });
                        },
                      ),
                      MyButton(
                        title: "3",
                        pressing: () {
                          setState(() {
                            userInput += "3";
                          });
                        },
                      ),
                      MyButton(
                        pressing: () {
                          setState(() {
                            userInput += "+";
                          });
                        },
                        title: "+",
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: ".",
                        pressing: () {
                          setState(() {
                            userInput += ".";
                          });
                        },
                      ),
                      MyButton(
                        title: "0",
                        pressing: () {
                          setState(() {
                            userInput += "0";
                          });
                        },
                      ),
                      MyButton(
                        title: "DEL",
                        pressing: () {
                          setState(() {
                            userInput.substring(0, userInput.length - 1);
                          });
                        },
                      ),
                      MyButton(
                        title: "=",
                        pressing: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp;
    try {
      exp = p.parse(finaluserinput);
    } catch (e) {
      print('Error parsing expression: $e');
      return;
    }

    ContextModel cm = ContextModel();
    double eval;
    try {
      eval = exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      print('Error evaluating expression: $e');
      return;
    }

    answer = eval.toString();
  }
}

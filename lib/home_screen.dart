import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userinput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Mybutton(
                          title: 'AC',
                          onpress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                        Mybutton(
                          title: '()',
                          onpress: () {
                            userinput += '()';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                        Mybutton(
                          title: '%',
                          onpress: () {
                            userinput += '%';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                        Mybutton(
                          title: '/',
                          onpress: () {
                            userinput += '/';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '7',
                          onpress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '8',
                          onpress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '9',
                          onpress: () {
                            userinput += '9';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: 'x',
                          onpress: () {
                            userinput += 'x';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '4',
                          onpress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '5',
                          onpress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '6',
                          onpress: () {
                            userinput += '6';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '-',
                          onpress: () {
                            userinput += '-';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '1',
                          onpress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '2',
                          onpress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '3',
                          onpress: () {
                            userinput += '3';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '+',
                          onpress: () {
                            userinput += '+';
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '0',
                          onpress: () {
                            userinput += '0';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '.',
                          onpress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: 'DEL',
                          onpress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '=',
                          onpress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: Color(0xFFB388FF),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userinput;
    finalUserInput = userinput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

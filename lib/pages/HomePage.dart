
import 'package:calculator/customs/button.dart';
import 'package:calculator/customs/calculator_card_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import '../customs/border_canvas.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userQuestion = '';
  late String userAnswer = '';

  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
             Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Simple Calculator',
                  style: GoogleFonts.michroma(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,

                  ),
                ),
              ),

            Expanded(
              flex:2,
              child: Padding(
                padding: const EdgeInsets.all(8.0).copyWith(
                  left: 10,
                  right: 8,
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: ShadowCardCanvas(),
                      child: Container(),
                    ),
                    CustomPaint(
                      painter: CalculatorCardCanvas(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child:  Text(
                                     userQuestion,
                                    style: GoogleFonts.bungee(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: userAnswer != ''
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),


                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child:  Text(
                                userAnswer,
                                style: GoogleFonts.bungee(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color:  userAnswer == '0'
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),


                            ),
                          ),

                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width - 30,

                          ),
                        ],
                      ),
                    ),
                    CustomPaint(
                      painter: BorderCanvas(),
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MyButton(
                        buttontab: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        },
                        color: Colors.green,
                        textcolor: Colors.white,
                        textbutton: buttons[index],
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttontab: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        color: Colors.red,
                        textcolor: Colors.white,
                        textbutton: buttons[index],
                      );
                    }
                    // equal button
                    else if (index == buttons.length - 1) {
                      return MyButton(
                        buttontab: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Colors.orange,
                        textcolor: Colors.black,
                        textbutton: buttons[index],
                      );
                    }
                    return MyButton(
                      buttontab: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      textbutton: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.orange
                          : Colors.black,
                      textcolor: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.white,
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }



  bool isOperator(String y) {
    if (y == '%' || y == '/' || y == 'x' || y == '-' || y == '+' || y == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    var finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

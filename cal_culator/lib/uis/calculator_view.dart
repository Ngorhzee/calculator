import 'dart:async';

import 'package:cal_culator/widgets/number_text.dart';
import 'package:cal_culator/widgets/symbols.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<Calculator> {
  final int limit = 15;
  String firstNum = "";
  String secondNum = "";
  String history = "";
  String textToDisplay = "";
  double result = 0;
  String operation = "";

  clearOperation() {
    setState(() {
      firstNum = "";
      secondNum = "";
      result = 0.0;
      operation = "";
    });
  }

  addInput(String value) {
    setState(() {
      if (operation.isEmpty) {
        if (firstNum.length <= limit) {
          firstNum = firstNum + value;
        }
      } else {
        if (secondNum.length <= limit) {
          secondNum = secondNum + value;
        }
      }
    });
  }

  addOperation(String value) {
    if (value == "-") {
      setState(() {
        if (firstNum.isEmpty) {
          firstNum = "-";
        } else if (operation.isNotEmpty) {
          secondNum = "-".toString() + secondNum;
        } else {
          operation = value;
        }
      });
    } else {
      setState(() {
        operation = value;
      });
    }
  }

  outputOperation() {
    
    setState(() {
      switch (operation) {
        case "+":
          result = double.parse(firstNum) + double.parse(secondNum);
          break;
        case "-":
          result = double.parse(firstNum) - double.parse(secondNum);
          break;
          case "*":
          result= double.parse(firstNum) * double.parse(secondNum) ;
          break;
          case "/":
          result= double.parse(firstNum) / double.parse(secondNum) ;
          break;
          case "%":
          result=double.parse(firstNum) /100;
          break;
        default:
      }
    });
  }

  removeLastValue() {
    setState(() {
      if (operation.isEmpty) {
        if (firstNum.isNotEmpty) {
          firstNum =
              firstNum.replaceRange(firstNum.length - 1, firstNum.length, "");
        }
      } else if (secondNum.isNotEmpty) {
        secondNum =
            secondNum.replaceRange(secondNum.length - 1, secondNum.length, "");
      } else {
        operation = "";
      }
    });
  }

  ngo(){
    setState(() {
      if(result!=null){
        result=double.parse(operation) + result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                height: 85,
                width: double.infinity,
                color: Colors.black,
                child: Text(
                  "CALCULATOR",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent),
                )),
            Container(
                alignment: Alignment.bottomRight,
                // color: Colors.red,
                height: 300,
                width: double.infinity,
                //Creating form field
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        history,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        result.toString(),
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        firstNum,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        operation,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        secondNum,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              height: 500,
              padding: EdgeInsets.all(30),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Symbol(title:"AC", btnOnclick:(){
                          clearOperation();
                        }),
                        Symbol(title:"%", btnOnclick:(){
                          addOperation("%");
                        }),
                        Symbol(title:"C", btnOnclick:(){
                          removeLastValue();
                        }),
                        Symbol(title:"/", btnOnclick:(){
                          addOperation("/");
                        }),
                      ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberText("7", () {
                          addInput("7");
                        }),
                        NumberText("8", () {
                          addInput("8");
                        }),
                        NumberText("9", () {
                          addInput("9");
                        }),
                        Symbol(title:"x",btnOnclick: () {
                          addOperation("*");
                        } )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberText("4", () {
                          addInput("4");
                        }),
                        NumberText("5", () {
                          addInput("5");
                        }),
                        NumberText("6", () {
                          addInput("6");
                        }),
                        Symbol(title:"-",btnOnclick: () {
                          addOperation('-');
                        } )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberText("1", () {
                          addInput("1");
                        }),
                        NumberText("2", () {
                          addInput("2");
                        }),
                        NumberText("3", () {
                          addInput("3");
                        }),
                        Symbol(title:"+",btnOnclick: () {
                          addOperation('+');
                          
                        })
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       NumberText("00", () {
                          addInput("00");
                        }),
                        NumberText("0", () {
                          addInput("0");
                        }),
                        NumberText(".", () {
                          addInput(".");
                        }),
                        Symbol(title:"=",btnOnclick: () {
                          outputOperation();
                        })
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

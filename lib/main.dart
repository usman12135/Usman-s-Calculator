import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons =
  [
    'C','DELETE','%','/',
    '9','8','7','X',
    '6','5','4','-',
    '3','2','1','+',
    '0','.','ANS','=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 50.0),
                   Container(
                     padding: EdgeInsets.all(20.0),
                     alignment: Alignment.centerLeft,
                       child: Text(userQuestion, style: TextStyle(fontSize: 20.0),)),
                  Container(
                      padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                      child: Text(userAnswer, style: TextStyle(fontSize: 20.0),))

                ],
              ),
            ),),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //clear button
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion='';
                        });
                      },
                        buttonText: buttons[index],
                      color: Colors.red,
                    );
                  }

                  //delete button
                  else if (index == 1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion=userQuestion.substring(0,userQuestion.length-1);
                        });
                      },
                        buttonText: buttons[index],
                      color: Colors.green,
                    );
                  }

                  //equal button
                  else if (index == buttons.length-1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                  equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.grey[850],
                    );
                  }

                  else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.grey[850],
                      textcolor: Colors.white,
                    );
                  };
                })
            ),),

        ],
      ),
    );
  }

  void equalPressed(){
    String finalQuestion = userQuestion;
    finalQuestion= finalQuestion.replaceAll('X', '*');

Parser p = Parser();
Expression exp = p.parse(finalQuestion);
ContextModel cm = ContextModel();
double eval = exp.evaluate(EvaluationType.REAL, cm);

userAnswer=eval.toString();
  }
}

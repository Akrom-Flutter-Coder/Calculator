import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equetion ="0";
  String rusualt="0";
buttonPressed(String buttonText){
  setState(() {
    if(buttonText=="C") {
      equetion="0";
    
    }

    else if(buttonText=="="){
     String expression=equetion;
     expression=expression.replaceAll("x", "*");
     expression=expression.replaceAll("/", "/");
     //expression=expression.replaceAll("", "*");
      try{
        Parser p=Parser();
        Expression exp=p.parse(expression);
        ContextModel cm=ContextModel();
        rusualt='${exp.evaluate(EvaluationType.REAL, cm)}';
        equetion=rusualt;
      }catch(e){
        rusualt="Error";
        equetion=rusualt;
      }

    }
    else if(buttonText=="⤆"){
      equetion=equetion.substring(0,equetion.length-1);
    }

   else{
     if(equetion=="0"){
       equetion=buttonText;
     }else{
     equetion=equetion+buttonText;
     }
   }
   

    
  });
}

Widget numButton(String btnText,Color btnColor,Color txtColor){
  return ElevatedButton(
  onPressed: () =>buttonPressed(btnText), 
  child: Text(btnText,
  style: TextStyle(fontSize: 25,
  color: txtColor),
  ),
  style: ElevatedButton.styleFrom(
    fixedSize: Size(70, 70),
    shape: CircleBorder(),
    primary: btnColor,
  ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
      title: const Center(child: Text('Calculator')),
      backgroundColor: Colors.black
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Padding(
                padding: EdgeInsets.all(28),
                child: Text(equetion,textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white,fontSize: 40),),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('C', Colors.redAccent, Colors.black),
              numButton('⤆', Colors.orange, Colors.black),
              numButton('%', Colors.orange, Colors.black),
              numButton('/', Colors.orange, Colors.white),

            ],
          ),
          SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('7', Colors.grey, Colors.black),
              numButton('8', Colors.grey, Colors.black),
              numButton('9', Colors.grey, Colors.black),
              numButton('x', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('4', Colors.grey, Colors.black),
              numButton('5', Colors.grey, Colors.black),
              numButton('6', Colors.grey, Colors.black),
              numButton('-', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('1', Colors.grey, Colors.black),
              numButton('2', Colors.grey, Colors.black),
              numButton('3', Colors.grey, Colors.black),
              numButton('+', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numButton('0', Colors.grey, Colors.black),
              numButton('00', Colors.grey, Colors.black),
              numButton('.', Colors.grey, Colors.black),
              numButton('=', Colors.redAccent, Colors.white),
            ],
          ),
          SizedBox(height: 20)


        ],
      ),),
    );
  }
}
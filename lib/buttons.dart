import 'package:flutter/material.dart';

 class MyButton extends StatelessWidget {

   final color;
   final textcolor;
   final String buttonText;
   final  buttonTapped;

   MyButton({this.color, this.textcolor,required this.buttonText,this.buttonTapped});

 
   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: buttonTapped,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ClipRect(
           child: Container(
              color: color,
             child: Center(child: Text(buttonText,style: TextStyle(color: textcolor, fontSize: 20.0,fontWeight: FontWeight.bold),), ),

           ),
         ),
       ),
     );
   }
 }
 
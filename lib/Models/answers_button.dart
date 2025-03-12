import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key , required this.answerText, required this.OnTap ,});
  
   final String answerText;
   final void Function() OnTap;
  @override
   Widget build(BuildContext context){
     return ElevatedButton(
       onPressed: OnTap,
       style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),                //padding of the button(space between text and border)
         backgroundColor: const Color.fromARGB(255,33,1,95),                            //margin : space between the button and the adjacent widgets
         foregroundColor: Colors.white,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
       ),       
       child: Text(answerText , textAlign: TextAlign.center),
     );
   }
}

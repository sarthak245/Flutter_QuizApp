import 'package:flutter/material.dart' ;
import 'package:project_2/Models/answers_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/Data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key , required this.onSelectAnswer, });
  final void Function(String answer) onSelectAnswer;
  @override 
         State<QuestionsScreen> createState(){
          return _QuestionsScreen();
         }
}
class _QuestionsScreen extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswers){
  widget.onSelectAnswer(selectedAnswers); 
      setState(() {
        currentQuestionIndex ++;                               //incrementing the question index only by 1
      });
    }
   @override
  Widget build(context) { 
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child : Container(
      margin: const EdgeInsets.all(40),     //width of the container (use as much width as it can)
      child: Column(
       
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
          currentQuestion.text,
        style:GoogleFonts.lato(
          color: Colors.white,
          fontSize: (40),
          fontWeight: FontWeight.bold,
          ),
          textAlign : TextAlign.center, 
        ),
        const SizedBox(height: 30),
        ...currentQuestion.getShuffledAnswers().map((answer) {          //dynamically creating buttons
          return AnswerButton(
          answerText: answer,
          OnTap: (){
            answerQuestion(answer);
          },
          );
        }),
        
      
          
      ],
      ),
      ),
    );
    
      
  }
  }
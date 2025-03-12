import 'package:flutter/material.dart';
import 'package:project_2/questions_screen.dart';
import 'package:project_2/start_screen.dart';
import 'package:project_2/data/questions.dart';
import 'package:project_2/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override 
         State<Quiz> createState(){
          return _QuizState();
         }
}
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
      if(selectedAnswers.length == questions.length){
        setState(() {
          activeScreen = 'results-screen';
        });
    }
  }
  
  // Add a restart function
  void restartQuiz() {
    setState(() {
      selectedAnswers = []; // Clear the selected answers
      activeScreen = 'start-screen'; // Navigate back to the start screen
    });
  }
  
  @override
  Widget build(context) {
       Widget screenWidget = StartScreen(switchScreen);
       
       if(activeScreen == 'questions-screen'){
         screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
       }                       

        if(activeScreen == 'results-screen'){
          screenWidget = ResultsScreen(
            chosenAnswers: selectedAnswers,
            onRestart: restartQuiz, // Pass the restart function
          );
        }                           
    return MaterialApp(
      home : Scaffold(
        body: Container(
             decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color.fromARGB(255, 159, 240, 240),
                   Color.fromARGB(255, 162, 236, 243),   
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
             ),
             child : screenWidget,
        ),
      ),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:project_2/questions_screen.dart';
import 'package:project_2/start_screen.dart';
import 'package:project_2/data/questions.dart';
import 'package:project_2/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override 
         State<Quiz> createState(){
          return _QuizState();
         }
}
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen' ;
  
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
      if(selectedAnswers.length  == questions.length){
        setState(() {
      
      activeScreen = 'results-screen';
    });
    }
  }
  @override
  Widget build(context) {
       Widget screenWidget = StartScreen(switchScreen);                        /*final screenWidget = activeScreen == 'start-screen'  ?  StartScreen(switchScreen) : const QuestionsScreen();*/
       if(activeScreen == 'questions-screen'){
         screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
       }                       

        if(activeScreen == 'results-screen'){
          screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,);
        }                           
    return MaterialApp(
      home : Scaffold(
        body: Container(
             decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color.fromARGB(255, 159, 240, 240),
                   Color.fromARGB(255, 162, 236, 243),   
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
             ),
             child : screenWidget,
        ),
      ),
    );
  }
}*/
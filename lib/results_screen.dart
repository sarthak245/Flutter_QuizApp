import 'package:flutter/material.dart';
import 'package:project_2/Data/questions.dart';
import 'package:project_2/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart,  // Add the restart callback
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;  // Define the restart callback

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
     
    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Answer': questions[i].answers[0],
        'user_Answer': chosenAnswers[i],
      });
    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_Answer'] == data['correct_Answer'];
    }).length;
    
    return Scaffold(  // Add Scaffold for proper layout
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
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 33, 1, 95),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData),
                const SizedBox(height: 20), // Add a bit more space
                TextButton.icon(
                  onPressed: onRestart, // Connect the restart function
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 33, 1, 95),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart Quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:project_2/Data/questions.dart';
import 'package:project_2/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
     
    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_Answer': questions[i].answers[0],
        'user_Answer': chosenAnswers[i],
      });
    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_Answer'] == data['correct_Answer'];
    }).length;
    
    return Scaffold(  // Add Scaffold for proper layout
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
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $numCorrectAnswers number out of $numTotalQuestions questions correctly',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 33, 1, 95),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData),  // Now wrapped in an Expanded
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 33, 1, 95),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart Quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:project_2/Data/questions.dart';
import 'package:project_2/questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers ;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
     
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i ,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        },
        );
      
    }
    return summary ;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $numCorrectAnswers number out of $numTotalQuestions questions correctly' ,),
            const SizedBox(
              height: 30,
              ),
            QuestionsSummary(getSummaryData()),

            const SizedBox(
              height: 30,
              ),
             TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
              )
          ],
        ),
      ),
    );
  }
}*/
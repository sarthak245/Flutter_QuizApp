import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(  // Use Expanded instead of fixed height SizedBox
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 33, 1, 95),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(  // This is crucial to constrain text width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 33, 1, 95),
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,  // Enable text wrapping
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_Answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 202, 34, 128),
                          ),
                          softWrap: true,  // Enable text wrapping
                        ),
                        const SizedBox(height: 2),
                        Text(
                          data['correct_Answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 73, 195, 97),
                          ),
                          softWrap: true,  // Enable text wrapping
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
        children: summaryData.map((data) {
          return Row(children: [
            Text(((data['question_index'] as int)+1).toString()),
            
              Expanded(
              child: Column(children: [
                Text(data['question'] as String),
                const SizedBox(height: 5,),
                Text(data['user_Answer']as String),
                Text(data['correct_Answer']as String),
              ],
              ),
              
            ),
          ],
          );
        },
        ).toList(),
        
           ),
      ),
    );
  }
}*/
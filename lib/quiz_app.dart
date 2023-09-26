import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/resultscreen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  
  
  void switchScreen() {
    setState(() {
      
      activeScreen =  'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }

  }


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if ( activeScreen == 'question-screen')
    {
      screenWidget =  QuestionScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen == 'result-screen'){
      screenWidget= ResultScreen(chosenAnswers: selectedAnswers,);
    }

             
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 77, 175, 193),
                Color.fromARGB(255, 64, 226, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

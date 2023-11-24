import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image1.jpg', // Replace with the path to your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Quiz Game!',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Test your knowledge with our quiz. Answer multiple-choice questions and see how well you do!',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the difficulty selection page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DifficultySelectionPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text('Start Quiz'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








class QuizScreenBody extends StatefulWidget {
  final List<Question> questions;

  QuizScreenBody({required this.questions});

  @override
  _QuizScreenBodyState createState() => _QuizScreenBodyState();
}

class _QuizScreenBodyState extends State<QuizScreenBody> {
  int currentQuestionIndex = 0;
  List<int?> userAnswers = [];
  int score = 0;
  int secondsRemaining = 20;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          // Time's up, move to the next question
          nextQuestion();
        }
      });
    });
  }

  void nextQuestion() {
    timer.cancel(); // Cancel the current timer
    secondsRemaining = 20; // Reset the timer for the next question

    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
        startTimer(); // Start the timer for the new question
      } else {
        // Display result screen
        showDialog(
          context: context,
          builder: (BuildContext context) {

            widget.questions.shuffle();

            return AlertDialog(
              title: Text('Quiz Completed'),
              content: Text('Your score: $score/${widget.questions.length}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // It close the and reenter the quiz(Reset the quiz)

                    setState(() {
                      currentQuestionIndex = 0;
                      userAnswers = [];
                      score = 0;
                    });
                    startTimer(); // Start the timer for the first question
                  },
                  child: Text('Restart'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void answerQuestion(int selectedAnswerIndex) {
    setState(() {
      timer.cancel(); // Cancel the current timer
      secondsRemaining = 20; // Reset the timer for the next question

      if (selectedAnswerIndex == widget.questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }

      userAnswers.add(selectedAnswerIndex);

      nextQuestion(); // Move to the next question
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.questions[currentQuestionIndex].questionText,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Center( // Center the entire column of answer buttons
          child: Column(
            children: List.generate(widget.questions[currentQuestionIndex].options.length, (index) {
              int optionIndex = index;
              String option = widget.questions[currentQuestionIndex].options[index];
              bool isCorrect = optionIndex == widget.questions[currentQuestionIndex].correctAnswerIndex;
              bool isUserAnswer =
                  userAnswers.length > currentQuestionIndex && userAnswers[currentQuestionIndex] == optionIndex;

              return Column(
                children: [
                  Container(
                    width: 200, // Set the desired width
                    child: ElevatedButton(
                      onPressed: () => answerQuestion(optionIndex),

                      child: SizedBox(
                        child: Center(
                          child: Text(option),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add space between answer buttons
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Time remaining: $secondsRemaining seconds',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}



}

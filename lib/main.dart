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






class DifficultySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Difficulty'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when the back arrow is pressed
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose a difficulty level:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen with the selected difficulty
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EasyQuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(

                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                minimumSize: Size(200, 50),
              ),
              child: Text('Easy'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen with the selected difficulty
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MediumQuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(

                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                minimumSize: Size(200, 50),
              ),
              child: Text('Medium'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the quiz screen with the selected difficulty
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HardQuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(

                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                minimumSize: Size(200, 50),
              ),
              child: Text('Hard'),
            ),
          ],
        ),
      ),
    );
  }
}

class EasyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Question> easyQuestions = [
      Question(
        questionText: 'What is the capital of Italy?',
        options: ['Paris', 'Rome', 'Berlin', 'Madrid'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Which planet is known as the Red Planet?',
        options: ['Mars', 'Jupiter', 'Venus', 'Saturn'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Which is the smallest prime number?',
        options: ['1', '2', '3', '5'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'How many colors are there in a rainbow?',
        options: ['5', '6', '7', '8'],
        correctAnswerIndex: 2,
      ),

      Question(
        questionText: 'What is the capital city of the United States?',
        options: ['Washington D.C.', 'New York City', 'Los Angeles', 'Chicago'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Who is known as the "Father of Computers"?',
        options: ['Bill Gates', 'Steve Jobs', 'Charles Babbage', 'Alan Turing'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Which ocean is the largest?',
        options: ['Atlantic', 'Indian', 'Southern', 'Pacific'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'What is the currency of Japan?',
        options: ['Won', 'Yuan', 'Ringgit', 'Yen'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'How many continents are there in the world?',
        options: ['5', '6', '7', '8'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'What is the largest mammal on land?',
        options: ['Elephant', 'Giraffe', 'Lion', 'Hippopotamus'],
        correctAnswerIndex: 0,
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Quiz'),
      ),
      body: QuizScreenBody(questions: easyQuestions),
    );
  }
}

class MediumQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Question> mediumQuestions = [
      Question(
        questionText: 'Who wrote "Romeo and Juliet"?',
        options: ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'In which year did World War II end?',
        options: ['1945', '1939', '1950', '1941'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'In what year did the first manned moon landing occur?',
        options: ['1965', '1969', '1973', '1981'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Who wrote the novel "To Kill a Mockingbird"?',
        options: ['J.K. Rowling', 'Harper Lee', 'George Orwell', 'Ernest Hemingway'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'What is the currency of Brazil?',
        options: ['Peso', 'Real', 'Dollar', 'Euro'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Which country is known as the "Land of the Rising Sun"?',
        options: ['China', 'Japan', 'South Korea', 'Thailand'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'In which year was the United Nations founded?',
        options: ['1945', '1920', '1955', '1971'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'What is the largest mammal in the world?',
        options: ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'What is the capital city of Australia?',
        options: ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
        correctAnswerIndex: 2,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Medium Quiz'),
      ),
      body: QuizScreenBody(questions: mediumQuestions),
    );
  }
}

class HardQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Question> hardQuestions = [
      Question(
        questionText: 'What is the capital of Mongolia?',
        options: ['Ulaanbaatar', 'Astana', 'Tashkent', 'Kiev'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Who discovered penicillin?',
        options: ['Marie Curie', 'Alexander Fleming', 'Louis Pasteur', 'Robert Koch'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'Who was the first woman to win a Nobel Prize?',
        options: ['Marie Curie', 'Rosalind Franklin', 'Jane Goodall', 'Mother Teresa'],
        correctAnswerIndex: 0,
      ),

      Question(
        questionText: 'Who was the famous physicist known for the theory of relativity?',
        options: ['Isaac Newton', 'Niels Bohr', 'Albert Einstein', 'Max Planck'],
        correctAnswerIndex: 2,
      ),

      Question(
        questionText: 'Which war is known as the "War of 1812"?',
        options: ['American Revolutionary War', 'Napoleonic Wars', 'Civil War', 'Second Anglo-American War'],
        correctAnswerIndex: 3,
      ),
      Question(
        questionText: 'What is the main component of Earth\'s atmosphere?',
        options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Argon'],
        correctAnswerIndex: 2,
      ),
      Question(
        questionText: 'Which mathematician is credited with the development of calculus?',
        options: ['Isaac Newton', 'Euclid', 'Archimedes', 'Gottfried Leibniz'],
        correctAnswerIndex: 3,
      ),

      Question(
        questionText: 'What is the longest river in the world?',
        options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Who was the ancient Egyptian queen known for her relationship with Julius Caesar and Mark Antony?',
        options: ['Nefertiti', 'Cleopatra', 'Hatshepsut', 'Nefertari'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'In what year did the Chernobyl nuclear disaster occur?',
        options: ['1986', '1979', '1991', '2000'],
        correctAnswerIndex: 0,
      ),
      Question(
        questionText: 'Which element has the chemical symbol "Au"?',
        options: ['Silver', 'Gold', 'Platinum', 'Uranium'],
        correctAnswerIndex: 1,
      ),
      Question(
        questionText: 'What is the largest desert in the world?',
        options: ['Sahara', 'Antarctica', 'Arabian', 'Gobi'],
        correctAnswerIndex: 1,
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hard Quiz'),
      ),
      body: QuizScreenBody(questions: hardQuestions),
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






class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

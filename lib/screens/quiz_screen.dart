import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> questions = [
    Question(
      questionText: "Apple",
      options: ["Elma", "Armut", "Portakal", "Muz"],
      correctAnswer: 0,
    ),
    Question(
      questionText: "Book",
      options: ["Kitap", "Defter", "Kalem", "Silgi"],
      correctAnswer: 0,
    ),
    Question(
      questionText: "House",
      options: ["Ev", "Araba", "Bina", "Dükkan"],
      correctAnswer: 0,
    ),
    Question(
      questionText: "Dog",
      options: ["Köpek", "Kedi", "Kuș", "Balık"],
      correctAnswer: 0,
    ),
    Question(
      questionText: "School",
      options: ["Okul", "Hastane", "Market", "Sinema"],
      correctAnswer: 0,
    ),
    // Add more questions here
  ];

  int currentQuestionIndex = 0;
  int? selectedAnswer;
  bool hasAnswered = false;
  bool isQuizFinished = false;
  int correctAnswers = 0;

  void checkAnswer(int selectedOption) {
    setState(() {
      selectedAnswer = selectedOption;
      hasAnswered = true;
      if (selectedOption == questions[currentQuestionIndex].correctAnswer) {
        correctAnswers++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        hasAnswered = false;
      });
    } else {
      setState(() {
        isQuizFinished = true;
      });
    }
  }

  Color getOptionColor(int optionIndex) {
    if (!hasAnswered) return Colors.white;

    if (optionIndex == questions[currentQuestionIndex].correctAnswer) {
      return Colors.green;
    }

    if (optionIndex == selectedAnswer) {
      return Colors.orange;
    }

    return Colors.white;
  }

  Color getOptionTextColor(int optionIndex) {
    if (!hasAnswered) return Colors.black87;
    if (optionIndex == questions[currentQuestionIndex].correctAnswer ) {
      return Colors.green;
    }
    return Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    if (isQuizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Quiz Results'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Your Score: $correctAnswers/${questions.length}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    selectedAnswer = null;
                    hasAnswered = false;
                    isQuizFinished = false;
                    correctAnswers = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            SizedBox(height: 20),

            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questions[currentQuestionIndex].questionText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            ...List.generate(
              questions[currentQuestionIndex].options.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: hasAnswered ? null : () => checkAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getOptionColor(index),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    questions[currentQuestionIndex].options[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: getOptionTextColor(index),
                    ),
                  ),
                ),
              ),
            ),

            if (hasAnswered) ...[
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

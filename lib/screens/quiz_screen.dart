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
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<String, List<Question>> levelQuestions = {
    'A1': [
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
        questionText: "Dog",
        options: ["Köpek", "Kedi", "At", "Kuş"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Window",
        options: ["Pencere", "Kapı", "Duvar", "Tavan"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Chair",
        options: ["Sandalye", "Masa", "Lamba", "Televizyon"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Pen",
        options: ["Kalem", "Kitap", "Defter", "Masa"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Table",
        options: ["Masa", "Lamba", "Koltuk", "Kitaplık"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Cat",
        options: ["Köpek", "Kedi", "Kanarya", "Balık"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Shirt",
        options: ["Gömlek", "Pantolon", "Ceket", "Ayakkabı"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Car",
        options: ["Araba", "Otobüs", "Tren", "Uçak"],
        correctAnswer: 0,
      ),
    ],

    'A2': [
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
        questionText: "Cat",
        options: ["Köpek", "Kedi", "Kanarya", "Balık"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Door",
        options: ["Kapı", "Pencere", "Balkon", "Çatı"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Street",
        options: ["Cadde", "Sokak", "Yol", "Park"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "School",
        options: ["Okul", "Hastane", "Market", "Sinema"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Teacher",
        options: ["Öğretmen", "Doktor", "Mühendis", "Hemşire"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Car",
        options: ["Araba", "Otobüs", "Tren", "Uçak"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Chair",
        options: ["Sandalye", "Masa", "Lamba", "Televizyon"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Bottle",
        options: ["Şişe", "Kupa", "Tabak", "Bardak"],
        correctAnswer: 0,
      ),
    ],

    'B1': [
      Question(
        questionText: "School",
        options: ["Okul", "Hastane", "Market", "Sinema"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Car",
        options: ["Araba", "Otobüs", "Tren", "Uçak"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Teacher",
        options: ["Öğretmen", "Doktor", "Mühendis", "Hemşire"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Library",
        options: ["Kütüphane", "Banka", "Postane", "Eczane"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Business",
        options: ["İş", "Bilim", "Edebiyat", "Felsefe"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Company",
        options: ["Şirket", "Kurum", "Büro", "Ofis"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Market",
        options: ["Market", "Süpermarket", "Bakkal", "Çarşı"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Medicine",
        options: ["İlaç", "Tıbbi", "Biyoloji", "Kimya"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Government",
        options: ["Hükümet", "Devlet", "Yönetim", "Liderlik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Job",
        options: ["İş", "Meslek", "Çalışma", "Görev"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "School",
        options: ["Okul", "Hastane", "Market", "Sinema"],
        correctAnswer: 2, // Doğru cevap 'Market'
      ),
      Question(
        questionText: "Car",
        options: ["Araba", "Otobüs", "Tren", "Uçak"],
        correctAnswer: 1, // Doğru cevap 'Otobüs'
      ),
      Question(
        questionText: "Teacher",
        options: ["Öğretmen", "Doktor", "Mühendis", "Hemşire"],
        correctAnswer: 2, // Doğru cevap 'Mühendis'
      ),
      Question(
        questionText: "Library",
        options: ["Kütüphane", "Banka", "Postane", "Eczane"],
        correctAnswer: 3, // Doğru cevap 'Eczane'
      ),
    ],
    'B2': [
      Question(
        questionText: "Environment",
        options: ["Çevre", "Hava", "Su", "Toprak"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Economy",
        options: ["Ekonomi", "Büyüme", "Gelişme", "Sanayi"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Technology",
        options: ["Teknoloji", "Mühendislik", "Bilim", "Matematik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Globalization",
        options: ["Küreselleşme", "Yerelleşme", "İzoleleşme", "Bağımsızlık"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Internet",
        options: ["İnternet", "Web", "Ağ", "Sosyal Medya"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Innovation",
        options: ["Yenilik", "Değişim", "Evrim", "Teknoloji"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Science",
        options: ["Bilim", "Teknoloji", "Matematik", "Kimya"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Politics",
        options: ["Politika", "Hükümet", "Yönetim", "Parti"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Education",
        options: ["Eğitim", "Okul", "Kurs", "Öğrenim"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Health",
        options: ["Sağlık", "Tedavi", "Hastalık", "Sağlık Sigortası"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Environment",
        options: ["Çevre", "Hava", "Su", "Toprak"],
        correctAnswer: 3, // Doğru cevap 'Toprak'
      ),
      Question(
        questionText: "Economy",
        options: ["Ekonomi", "Büyüme", "Gelişme", "Sanayi"],
        correctAnswer: 0, // Doğru cevap 'Ekonomi'
      ),
      Question(
        questionText: "Technology",
        options: ["Teknoloji", "Mühendislik", "Bilim", "Matematik"],
        correctAnswer: 2, // Doğru cevap 'Bilim'
      ),
      Question(
        questionText: "Globalization",
        options: ["Küreselleşme", "Yerelleşme", "İzoleleşme", "Bağımsızlık"],
        correctAnswer: 1, // Doğru cevap 'Yerelleşme'
      ),
    ],
    'C1': [
      Question(
        questionText: "Sustainability",
        options: ["Sürdürülebilirlik", "Kalkınma", "Büyüme", "Çevre"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Innovation",
        options: ["Yenilik", "Değişim", "Evrim", "Teknoloji"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Entrepreneurship",
        options: ["Girişimcilik", "Yatırım", "Yönetim", "İşletme"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Artificial Intelligence",
        options: ["Yapay Zeka", "Makine Öğrenmesi", "Veri Madenciliği", "Algoritma"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Neuroscience",
        options: ["Sinirbilim", "Psikoloji", "Biyoloji", "Felsefe"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Biotechnology",
        options: ["Biyoteknoloji", "Kimya", "Fizik", "Genetik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Globalization",
        options: ["Küreselleşme", "Yerelleşme", "Global Düşünme", "Bölgeselleşme"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Data Analysis",
        options: ["Veri Analizi", "Büyük Veri", "Yapay Zeka", "İstatistik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Cognitive Psychology",
        options: ["Bilişsel Psikoloji", "Davranışsal Psikoloji", "Sosyal Psikoloji", "Klinik Psikoloji"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Quantum Computing",
        options: ["Kuantum Hesaplama", "Bilgisayar Bilimleri", "Veri Bilimi", "Yapay Zeka"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Sustainability",
        options: ["Sürdürülebilirlik", "Kalkınma", "Büyüme", "Çevre"],
        correctAnswer: 3,
      ),
      Question(
        questionText: "Innovation",
        options: ["Yenilik", "Değişim", "Evrim", "Teknoloji"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Entrepreneurship",
        options: ["Girişimcilik", "Yatırım", "Yönetim", "İşletme"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Artificial Intelligence",
        options: ["Yapay Zeka", "Makine Öğrenmesi", "Veri Madenciliği", "Algoritma"],
        correctAnswer: 3,
      ),
    ],
    'C2': [
      Question(
        questionText: "Epistemology",
        options: ["Epistemoloji", "Ontoloji", "Metafizik", "Estetik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Heuristic",
        options: ["Hikmet", "Keşif", "Yöntem", "Çözümleme"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Existentialism",
        options: ["Varoluşçuluk", "Humanizm", "Pragmatizm", "Empirizm"],
        correctAnswer: 3,
      ),
      Question(
        questionText: "Determinism",
        options: ["Belirlenimcilik", "Özgür irade", "Felsefi idealizm", "Sosyal determinizm"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Paradigm",
        options: ["Paradigma", "Model", "Yöntem", "Çerçeve"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Hermeneutics",
        options: ["Hermeneutik", "Epistemoloji", "Fenomenoloji", "Retorik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Ontological",
        options: ["Ontolojik", "Psikolojik", "Sosyolojik", "Felsefi"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Phenomenology",
        options: ["Fenomenoloji", "Psikanaliz", "Sosyoloji", "Etnografi"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Dialectic",
        options: ["Diyalektik", "Kritik", "Analitik", "Aşkın"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Metaphysics",
        options: ["Metafizik", "Epistemoloji", "Edebiyat teorisi", "Felsefi idealizm"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Epistemology",
        options: ["Epistemoloji", "Ontoloji", "Metafizik", "Estetik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Heuristic",
        options: ["Hikmet", "Keşif", "Yöntem", "Çözümleme"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Existentialism",
        options: ["Varoluşçuluk", "Humanizm", "Pragmatizm", "Empirizm"],
        correctAnswer: 3,
      ),
      Question(
        questionText: "Determinism",
        options: ["Belirlenimcilik", "Özgür irade", "Felsefi idealizm", "Sosyal determinizm"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Paradigm",
        options: ["Paradigma", "Model", "Yöntem", "Çerçeve"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Hermeneutics",
        options: ["Hermeneutik", "Epistemoloji", "Fenomenoloji", "Retorik"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Ontological",
        options: ["Ontolojik", "Psikolojik", "Sosyolojik", "Felsefi"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Phenomenology",
        options: ["Fenomenoloji", "Psikanaliz", "Sosyoloji", "Etnografi"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Dialectic",
        options: ["Diyalektik", "Kritik", "Analitik", "Aşkın"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Metaphysics",
        options: ["Metafizik", "Epistemoloji", "Edebiyat teorisi", "Felsefi idealizm"],
        correctAnswer: 0,
      ),
    ],
  };


  String selectedLevel = 'A1';
  int currentQuestionIndex = 0;
  int? selectedAnswer;
  bool hasAnswered = false;
  bool isQuizFinished = false;
  int correctAnswers = 0;

  void checkAnswer(int selectedOption) {
    setState(() {
      selectedAnswer = selectedOption;
      hasAnswered = true;
      if (selectedOption == levelQuestions[selectedLevel]![currentQuestionIndex].correctAnswer) {
        correctAnswers++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < levelQuestions[selectedLevel]!.length - 1) {
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

    if (optionIndex == levelQuestions[selectedLevel]![currentQuestionIndex].correctAnswer) {
      return Colors.green;
    }

    if (optionIndex == selectedAnswer) {
      return Colors.red;
    }

    return Colors.white;
  }

  Color getOptionTextColor(int optionIndex) {
    if (!hasAnswered) return Colors.black87;
    if (optionIndex == levelQuestions[selectedLevel]![currentQuestionIndex].correctAnswer ) {
      return Colors.green;
    }
    return Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    if (isQuizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Results'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Completed!',
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $correctAnswers/${levelQuestions[selectedLevel]!.length}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
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
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
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
        title: const Text(
          'Quiz',
          style: TextStyle(
            color: Colors.white,  // Beyaz renk
            fontWeight: FontWeight.bold,  // Kalın yazı
          ),
        ),
        centerTitle: true,  // Center the title
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedLevel,
              items: levelQuestions.keys
                  .map((level) => DropdownMenuItem(
                value: level,
                child: Text(level),
              ))
                  .toList(),
              onChanged: (newLevel) {
                setState(() {
                  selectedLevel = newLevel!;
                  currentQuestionIndex = 0;
                  selectedAnswer = null;
                  hasAnswered = false;
                  isQuizFinished = false;
                  correctAnswers = 0;
                });
              },
            ),
            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / levelQuestions[selectedLevel]!.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            const SizedBox(height: 20),

            Text(
              'Question ${currentQuestionIndex + 1}/${levelQuestions[selectedLevel]!.length}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  levelQuestions[selectedLevel]![currentQuestionIndex].questionText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ...List.generate(
              levelQuestions[selectedLevel]![currentQuestionIndex].options.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: hasAnswered ? null : () => checkAnswer(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getOptionColor(index),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    levelQuestions[selectedLevel]![currentQuestionIndex].options[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: getOptionTextColor(index),
                    ),
                  ),
                ),
              ),
            ),

            if (hasAnswered) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < levelQuestions[selectedLevel]!.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: const TextStyle(
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


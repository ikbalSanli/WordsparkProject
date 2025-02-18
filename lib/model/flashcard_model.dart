class Flashcard {
  final String english;
  final String turkish;
  final String? example;
  final String? category;
  bool isFavorite;
  bool isLearned;

  Flashcard({
    required this.english,
    required this.turkish,
    this.example,
    this.category,
    this.isFavorite = false,
    this.isLearned = false,
  });
}
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
        questionText: "What color is the sky on a clear day?",
        options: ["Green", "Blue", "Red", "Black"],
        correctAnswer: 1, // Blue
      ),
      Question(
        questionText: "How many legs does a spider have?",
        options: ["6", "8", "4", "10"],
        correctAnswer: 1, // 8
      ),
      Question(
        questionText: "What do you drink in the morning?",
        options: ["Water", "Milk", "Juice", "All of them"],
        correctAnswer: 3, // All of them
      ),
      Question(
        questionText: "Which fruit is yellow and long?",
        options: ["Apple", "Banana", "Grape", "Strawberry"],
        correctAnswer: 1, // Banana
      ),
      Question(
        questionText: "Which day comes after Monday?",
        options: ["Sunday", "Tuesday", "Wednesday", "Friday"],
        correctAnswer: 1, // Tuesday
      ),
      Question(
        questionText: "What is the opposite of 'big'?",
        options: ["Tall", "Long", "Small", "Wide"],
        correctAnswer: 2, // Small
      ),
      Question(
        questionText: "Which one is a color?",
        options: ["Chair", "Blue", "Book", "Shoe"],
        correctAnswer: 1, // Blue
      ),
      Question(
        questionText: "Where do you sleep?",
        options: ["Table", "Chair", "Bed", "Sofa"],
        correctAnswer: 2, // Bed
      ),
      Question(
        questionText: "How many days are there in a week?",
        options: ["5", "6", "7", "8"],
        correctAnswer: 2, // 7
      ),
      Question(
        questionText: "What is the color of an apple?",
        options: ["Blue", "Red", "Black", "Purple"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "How many legs does a cat have?",
        options: ["Two", "Four", "Six", "Eight"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you sleep?",
        options: ["In a bed", "In a fridge", "On a bus", "Under a table"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which animal says 'woof woof'?",
        options: ["Cat", "Dog", "Cow", "Bird"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you drink in the morning?",
        options: ["Tea", "Shoes", "Books", "Chairs"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which day comes after Monday?",
        options: ["Sunday", "Tuesday", "Friday", "Saturday"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you use to write?",
        options: ["A pen", "A spoon", "A ball", "A car"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What is the weather like when it rains?",
        options: ["Sunny", "Rainy", "Snowy", "Windy"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which number comes after five?",
        options: ["Four", "Six", "Ten", "Two"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you buy food?",
        options: ["At a supermarket", "At a school", "At a park", "At a cinema"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you wear when it's cold?",
        options: ["A jacket", "A swimsuit", "Sandals", "Sunglasses"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which is a vegetable?",
        options: ["Banana", "Tomato", "Chocolate", "Water"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you say when you meet someone?",
        options: ["Goodbye", "Hello", "Thank you", "Sorry"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you see fish?",
        options: ["In the sky", "In the water", "In a tree", "On a mountain"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you use to eat soup?",
        options: ["A fork", "A spoon", "A knife", "A plate"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which is a sweet food?",
        options: ["Ice cream", "Salt", "Pepper", "Onion"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you call your mother's sister?",
        options: ["Grandmother", "Aunt", "Uncle", "Cousin"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you go to learn?",
        options: ["School", "Restaurant", "Beach", "Airport"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you do with a book?",
        options: ["Eat it", "Read it", "Wash it", "Throw it"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which is a big animal?",
        options: ["Ant", "Elephant", "Mouse", "Butterfly"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you do at night?",
        options: ["Sleep", "Run", "Eat breakfast", "Go to school"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which is a drink?",
        options: ["Pizza", "Water", "Bread", "Rice"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you use to brush your teeth?",
        options: ["Toothbrush", "Soap", "Comb", "Towel"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which is a part of the face?",
        options: ["Nose", "Arm", "Leg", "Foot"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you say when you leave?",
        options: ["Hello", "Goodbye", "Thank you", "Please"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which is a color?",
        options: ["Tree", "Green", "Stone", "Cloud"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What do you do when you are hungry?",
        options: ["Sleep", "Eat", "Dance", "Sing"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you cook food?",
        options: ["In the kitchen", "In the bathroom", "In the garden", "In the car"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which is a baby animal?",
        options: ["Kitten", "Lion", "Elephant", "Giraffe"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you do with money?",
        options: ["Eat it", "Buy things", "Throw it", "Hide it"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which animal says 'meow'?",
        options: ["Dog", "Cow", "Cat", "Sheep"],
        correctAnswer: 2, // Cat
      ),
    ],

    'A2': [
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "She don't like apples.",
          "She doesn't likes apples.",
          "She doesn't like apples.",
          "She not like apples."
        ],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "What is the opposite of 'expensive'?",
        options: ["Cheap", "Big", "Noisy", "Difficult"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which verb is irregular?",
        options: ["Walk", "Play", "Go", "Work"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "What do you use to cut paper?",
        options: ["Spoon", "Scissors", "Plate", "Chair"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which is NOT a room in a house?",
        options: ["Kitchen", "Garden", "Bedroom", "Bathroom"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the past simple of 'study'?",
        options: ["Studyed", "Studied", "Studying", "Studies"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I am usually go to school by bus.",
          "I usually go to school by bus.",
          "I usually going to school by bus.",
          "I usually goes to school by bus."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the capital of Australia?",
        options: ["Sydney", "Melbourne", "Canberra", "Perth"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "Which word describes weather?",
        options: ["Sunny", "Hungry", "Angry", "Beautiful"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the plural of 'child'?",
        options: ["Childs", "Children", "Childes", "Child"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is in the present continuous?",
        options: [
          "She writes a letter.",
          "She is writing a letter.",
          "She wrote a letter.",
          "She will write a letter."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the opposite of 'polite'?",
        options: ["Happy", "Rude", "Quiet", "Fast"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which is a countable noun?",
        options: ["Water", "Rice", "Apple", "Sugar"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "What is the past participle of 'eat'?",
        options: ["Eated", "Ate", "Eaten", "Eating"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "Which word is a preposition?",
        options: ["Happy", "Under", "Run", "Beautiful"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the comparative form of 'good'?",
        options: ["Gooder", "Better", "Best", "More good"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I have seen him yesterday.",
          "I saw him yesterday.",
          "I see him yesterday.",
          "I seeing him yesterday."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the opposite of 'arrive'?",
        options: ["Come", "Leave", "Stay", "Visit"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which word is an adverb?",
        options: ["Quick", "Quickly", "Quickness", "Quicken"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the superlative form of 'bad'?",
        options: ["Badder", "Badly", "Worst", "Baddest"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "She can to swim very well.",
          "She can swim very well.",
          "She cans swim very well.",
          "She could swim very well."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the opposite of 'lend'?",
        options: ["Give", "Take", "Borrow", "Steal"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "Which word is a conjunction?",
        options: ["And", "Happy", "Run", "Beautiful"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the past simple of 'teach'?",
        options: ["Teached", "Taught", "Teaching", "Teaches"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I have been to Paris last year.",
          "I went to Paris last year.",
          "I go to Paris last year.",
          "I going to Paris last year."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the opposite of 'remember'?",
        options: ["Forget", "Recall", "Remind", "Think"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which word is a pronoun?",
        options: ["Run", "Beautiful", "She", "Quickly"],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "What is the past participle of 'write'?",
        options: ["Wrote", "Written", "Writed", "Writing"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "If I will have time, I will call you.",
          "If I have time, I will call you.",
          "If I has time, I will call you.",
          "If I had time, I will call you."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the opposite of 'patient'?",
        options: ["Kind", "Impatient", "Happy", "Quick"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What time do you usually wake up?",
        options: ["In the morning", "At night", "In the afternoon", "At midnight"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "Which one is a means of transport?",
        options: ["Car", "Bread", "Pencil", "Phone"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What is the opposite of 'easy'?",
        options: ["Simple", "Difficult", "Nice", "Slow"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where can you borrow books?",
        options: ["Library", "Supermarket", "Pharmacy", "Bakery"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you need to send an email?",
        options: ["Envelope", "Stamp", "Internet", "Paper"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which one is a job?",
        options: ["Teacher", "Table", "Music", "Hat"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do you wear on your feet?",
        options: ["Hat", "Shoes", "Gloves", "Scarf"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which place is best to see animals?",
        options: ["Zoo", "Library", "Hospital", "Airport"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What do people usually do in a restaurant?",
        options: ["Study", "Sleep", "Eat", "Run"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What is the weather like in summer?",
        options: ["Cold", "Rainy", "Hot", "Snowy"],
        correctAnswer: 2,
      ),
    ],
    'B1': [
      Question(
        questionText: "Which phrasal verb means 'to cancel'?",
        options: ["Call off", "Put off", "Take off", "Turn off"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the correct passive form of: 'They built this house in 1990.'?",
        options: [
          "This house was built in 1990.",
          "This house is built in 1990.",
          "This house built in 1990.",
          "This house has built in 1990."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which word means 'extremely tired'?",
        options: ["Happy", "Exhausted", "Angry", "Excited"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the correct reported speech for: 'I will help you,' she said.",
        options: [
          "She said she will help me.",
          "She said she would help me.",
          "She said she helps me.",
          "She said she helped me."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses the present perfect correctly?",
        options: [
          "I have seen that movie yesterday.",
          "I have seen that movie last week.",
          "I have seen that movie before.",
          "I saw that movie before."
        ],
        correctAnswer: 2, // 3. şık
      ),
      Question(
        questionText: "What does 'bittersweet' mean?",
        options: [
          "Very sweet",
          "Both happy and sad",
          "Very bitter",
          "Neither happy nor sad"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which is the correct tag question: 'You don't like coffee, ___?'",
        options: ["do you", "don't you", "aren't you", "does you"],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'to look up to someone'?",
        options: [
          "To criticize someone",
          "To admire someone",
          "To ignore someone",
          "To look for someone"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is grammatically correct?",
        options: [
          "If I would have known, I would have come.",
          "If I had known, I would have come.",
          "If I have known, I would have come.",
          "If I knew, I would have come."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the synonym of 'furious'?",
        options: ["Happy", "Angry", "Sad", "Tired"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'used to' correctly?",
        options: [
          "I used to playing football.",
          "I used to play football.",
          "I am used to play football.",
          "I use to play football."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What does 'to turn a blind eye' mean?",
        options: [
          "To watch carefully",
          "To ignore something",
          "To look at something",
          "To close one's eyes"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is in the past perfect tense?",
        options: [
          "She had finished her homework before dinner.",
          "She has finished her homework before dinner.",
          "She finished her homework before dinner.",
          "She was finishing her homework before dinner."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the antonym of 'generous'?",
        options: ["Kind", "Stingy", "Happy", "Brave"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'unless' correctly?",
        options: [
          "I will go unless it rains.",
          "I will go if it rains.",
          "I will go when it rains.",
          "I will go because it rains."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'to hit the sack' mean?",
        options: [
          "To go to bed",
          "To hit something",
          "To pack a bag",
          "To clean the house"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "She suggested to go to the cinema.",
          "She suggested going to the cinema.",
          "She suggested go to the cinema.",
          "She suggested that going to the cinema."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to break the ice'?",
        options: [
          "To melt ice",
          "To start a conversation",
          "To break something",
          "To be cold"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'despite' correctly?",
        options: [
          "Despite it was raining, we went out.",
          "Despite the rain, we went out.",
          "Despite of the rain, we went out.",
          "Despite to the rain, we went out."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the synonym of 'diligent'?",
        options: ["Lazy", "Hardworking", "Slow", "Careless"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I look forward to hear from you.",
          "I look forward to hearing from you.",
          "I look forward hear from you.",
          "I look forward hearing from you."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What does 'to let the cat out of the bag' mean?",
        options: [
          "To release a cat",
          "To reveal a secret",
          "To buy a cat",
          "To hide something"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'wish' correctly?",
        options: [
          "I wish I can swim.",
          "I wish I could swim.",
          "I wish I swimming.",
          "I wish I to swim."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to pull someone's leg'?",
        options: [
          "To hurt someone",
          "To joke with someone",
          "To help someone",
          "To ignore someone"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "She denied to steal the money.",
          "She denied stealing the money.",
          "She denied steal the money.",
          "She denied that steal the money."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the synonym of 'ambiguous'?",
        options: ["Clear", "Unclear", "Happy", "Sad"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'as long as' correctly?",
        options: [
          "You can stay as long as you want.",
          "You can stay as long you want.",
          "You can stay long as you want.",
          "You can stay as long than you want."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'to spill the beans' mean?",
        options: [
          "To clean the kitchen",
          "To reveal a secret",
          "To cook something",
          "To buy groceries"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I would rather to stay at home.",
          "I would rather stay at home.",
          "I would rather staying at home.",
          "I would rather stayed at home."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to burn the midnight oil'?",
        options: [
          "To stay up late working",
          "To light a candle",
          "To cook at night",
          "To have a fire"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Why do people recycle?",
        options: ["To save money", "To help the environment", "To get rich", "To waste time"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which device is used to take photos?",
        options: ["Camera", "Printer", "Television", "Microwave"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What is a synonym of 'important'?",
        options: ["Easy", "Necessary", "Funny", "Beautiful"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which one is a renewable energy source?",
        options: ["Oil", "Gas", "Coal", "Solar"],
        correctAnswer: 3,
      ),
      Question(
        questionText: "What is a blog?",
        options: ["A book", "A website with posts", "A music app", "A photo album"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which job involves teaching students?",
        options: ["Chef", "Doctor", "Teacher", "Pilot"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which one is a common reason to exercise?",
        options: ["To gain weight", "To stay healthy", "To be tired", "To avoid people"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Where do you usually check in at the airport?",
        options: ["Café", "Ticket office", "Check-in desk", "Security gate"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What does a pharmacist do?",
        options: ["Sells clothes", "Cooks meals", "Gives medicine", "Builds houses"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What is the purpose of a resume?",
        options: ["To apply for a job", "To pay bills", "To travel", "To shop online"],
        correctAnswer: 0,
      ),
    ],
    'B2': [
      Question(
        questionText: "Which phrase means 'to tolerate'?",
        options: [
          "Put up with",
          "Put down with",
          "Put off with",
          "Put on with"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the correct inversion for: 'I had never seen such a beautiful sunset.'",
        options: [
          "Never had I seen such a beautiful sunset.",
          "Never I had seen such a beautiful sunset.",
          "Never seen I had such a beautiful sunset.",
          "Never had seen I such a beautiful sunset."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which word means 'to make something less severe'?",
        options: ["Aggravate", "Alleviate", "Amplify", "Annihilate"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the correct mixed conditional for: 'If I had studied harder, I would have a better job now.'",
        options: [
          "If I studied harder, I would have a better job now.",
          "If I had studied harder, I would have a better job now.",
          "If I would study harder, I had a better job now.",
          "If I study harder, I would have a better job now."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'notwithstanding' correctly?",
        options: [
          "Notwithstanding the rain, the event was cancelled.",
          "Notwithstanding the rain, the event went ahead.",
          "Notwithstanding to the rain, the event went ahead.",
          "Notwithstanding of the rain, the event went ahead."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to take something with a grain of salt'?",
        options: [
          "To believe something completely",
          "To be skeptical about something",
          "To add salt to food",
          "To reject something entirely"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is grammatically correct?",
        options: [
          "Had I known, I would have helped.",
          "Have I known, I would have helped.",
          "Did I know, I would have helped.",
          "Would I know, I would have helped."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the synonym of 'ephemeral'?",
        options: ["Permanent", "Temporary", "Eternal", "Lasting"],
        correctAnswer: 1, // 2. şık
      ),

      Question(
        questionText: "What does 'to throw in the towel' mean?",
        options: [
          "To start a fight",
          "To give up",
          "To clean something",
          "To exercise"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "The more you practice, the better you get.",
          "The more you practice, the better you will get.",
          "The more you practice, the better you got.",
          "The more you practice, the better you getting."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'to have a chip on one's shoulder'?",
        options: [
          "To be very happy",
          "To be easily angered",
          "To be very hungry",
          "To be very tired"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'as though' correctly?",
        options: [
          "He looks as though he is tired.",
          "He looks as though he tired.",
          "He looks as though he be tired.",
          "He looks as though he was tired."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the antonym of 'meticulous'?",
        options: ["Careful", "Careless", "Thoughtful", "Detailed"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "I'd sooner to stay at home than go out.",
          "I'd sooner stay at home than go out.",
          "I'd sooner staying at home than go out.",
          "I'd sooner stayed at home than go out."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What does 'to read between the lines' mean?",
        options: [
          "To read quickly",
          "To understand the hidden meaning",
          "To skip lines while reading",
          "To read aloud"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'were' in the subjunctive mood?",
        options: [
          "If I was you, I would apologize.",
          "If I were you, I would apologize.",
          "If I am you, I would apologize.",
          "If I be you, I would apologize."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to beat around the bush'?",
        options: [
          "To be direct",
          "To avoid the main topic",
          "To hit something",
          "To run quickly"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "Not only she sings, but she also dances.",
          "Not only does she sing, but she also dances.",
          "Not only she sing, but she also dances.",
          "Not only do she sing, but she also dances."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the synonym of 'ubiquitous'?",
        options: ["Rare", "Everywhere", "Nowhere", "Scarce"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'insofar as' correctly?",
        options: [
          "Insofar as I know, the meeting is tomorrow.",
          "Insofar I know, the meeting is tomorrow.",
          "Insofar to I know, the meeting is tomorrow.",
          "Insofar that I know, the meeting is tomorrow."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'to bite the bullet' mean?",
        options: [
          "To eat something hard",
          "To endure a painful situation",
          "To avoid a problem",
          "To start a fight"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "The project was completed by the team.",
          "The project was completed from the team.",
          "The project was completed at the team.",
          "The project was completed with the team."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'to cry over spilled milk'?",
        options: [
          "To be very happy",
          "To regret something that cannot be changed",
          "To clean up a mess",
          "To be very sad"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'provided that' correctly?",
        options: [
          "I will go provided that it doesn't rain.",
          "I will go provided it doesn't rain.",
          "I will go provided to it doesn't rain.",
          "I will go provided it not rain."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the antonym of 'verbose'?",
        options: ["Wordy", "Concise", "Long", "Detailed"],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "Had it not been for your help, I would have failed.",
          "Had it not been your help, I would have failed.",
          "Had it not been to your help, I would have failed.",
          "Had it not been of your help, I would have failed."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'to let sleeping dogs lie' mean?",
        options: [
          "To wake someone up",
          "To avoid stirring up old issues",
          "To take care of dogs",
          "To be lazy"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'so as to' correctly?",
        options: [
          "I left early so as to not miss the train.",
          "I left early so as not to miss the train.",
          "I left early so as to don't miss the train.",
          "I left early so as to not missing the train."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to play devil's advocate'?",
        options: [
          "To argue against something for the sake of discussion",
          "To support evil",
          "To defend someone",
          "To be very angry"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence is correct?",
        options: [
          "Such was his anger that he left the room.",
          "Such his anger was that he left the room.",
          "Such was his anger he left the room.",
          "Such his anger that he left the room."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the main cause of climate change?",
        options: ["Deforestation", "Urbanization", "Greenhouse gases", "Overpopulation"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which is the most suitable synonym for 'accurate'?",
        options: ["Correct", "Creative", "Average", "Logical"],
        correctAnswer: 0,
      ),
      Question(
        questionText: "What does the term 'bilingual' refer to?",
        options: ["Two cities", "Two languages", "Two cultures", "Two schools"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is the purpose of a cover letter?",
        options: ["To list references", "To explain resume details", "To introduce yourself", "To request payment"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What can be considered a disadvantage of working remotely?",
        options: ["No commute", "Flexible hours", "Isolation", "Lower expenses"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which of the following best defines 'entrepreneur'?",
        options: ["Investor", "Employer", "Business founder", "Manager"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which skill is essential for effective teamwork?",
        options: ["Creativity", "Listening", "Ambition", "Confidence"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is the function of a thesis in an academic essay?",
        options: ["It entertains the reader", "It presents the main idea", "It describes a story", "It provides statistics"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which word means 'to support an idea or cause publicly'?",
        options: ["Criticize", "Argue", "Advocate", "Avoid"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Why do people attend networking events?",
        options: ["To relax", "To meet professionals", "To listen to music", "To find dates"],
        correctAnswer: 1,
      ),
    ],
    'C1': [
      Question(
        questionText: "Which sentence demonstrates the correct use of 'inversion' for emphasis?",
        options: [
          "Rarely I have seen such dedication.",
          "Rarely have I seen such dedication.",
          "Rarely do I have seen such dedication.",
          "Rarely I did see such dedication."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What does 'to gild the lily' mean?",
        options: [
          "To decorate excessively",
          "To plant flowers",
          "To criticize harshly",
          "To simplify something"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which phrase correctly completes this sentence: 'Had it not been for your intervention, the project _____ a failure.'?",
        options: [
          "would be",
          "would have been",
          "will be",
          "had been"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the nuanced difference between 'connotation' and 'denotation'?",
        options: [
          "Connotation is literal meaning; denotation is emotional association.",
          "Connotation is emotional association; denotation is literal meaning.",
          "Both terms refer to dictionary definitions.",
          "Denotation is a grammatical term."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'anaphora' as a rhetorical device?",
        options: [
          "She ran, she jumped, she conquered.",
          "The world is a stage.",
          "His smile was like sunshine.",
          "Time flies like an arrow."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'sesquipedalian' mean?",
        options: [
          "Using long words unnecessarily",
          "A type of measurement",
          "Related to feet",
          "A musical term"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence is grammatically complex but correct?",
        options: [
          "Not only the company expanded its operations, but also it diversified its products.",
          "Not only did the company expand its operations, but it also diversified its products.",
          "Not only the company did expand its operations, but also diversified its products.",
          "Not only expanded the company its operations, but also diversified it its products."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to quixotically tilt at windmills'?",
        options: [
          "To fight imaginary enemies",
          "To repair broken machinery",
          "To enjoy outdoor activities",
          "To study meteorology"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence demonstrates 'zeugma'?",
        options: [
          "She broke his car and his heart.",
          "The sun smiled down on us.",
          "I came, I saw, I conquered.",
          "The wind howled angrily."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'solipsistic' mean?",
        options: [
          "Relating to the sun",
          "Believing only oneself exists",
          "A type of artistic style",
          "A mathematical concept"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses the subjunctive mood correctly?",
        options: [
          "If I was president, I would change the law.",
          "If I were president, I would change the law.",
          "If I am president, I would change the law.",
          "If I be president, I would change the law."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the primary function of a 'gerund' in English grammar?",
        options: [
          "To act as a verb",
          "To act as a noun",
          "To modify adjectives",
          "To create passive voice"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which literary device is used in: 'The stars danced playfully in the moonlit sky.'?",
        options: [
          "Metonymy",
          "Personification",
          "Synecdoche",
          "Onomatopoeia"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What does 'defenestration' mean?",
        options: [
          "The act of throwing someone out of a window",
          "A dental procedure",
          "A type of architectural design",
          "A philosophical concept"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence is an example of a 'mixed conditional'?",
        options: [
          "If you heat ice, it melts.",
          "If I had studied harder, I would pass the exam.",
          "If I were you, I would apologize.",
          "If it rains, we will cancel the picnic."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to be hoist with one's own petard'?",
        options: [
          "To be injured by one's own weapon",
          "To celebrate a victory",
          "To climb a mountain",
          "To cook a meal"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence uses 'litotes'?",
        options: [
          "She's not unkind.",
          "The thunder roared like a lion.",
          "I’m so hungry I could eat a horse.",
          "Her smile was a mile wide."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'antediluvian' mean?",
        options: [
          "Relating to the future",
          "Extremely old-fashioned",
          "Related to floods",
          "A type of plant"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence demonstrates 'parallelism'?",
        options: [
          "She likes cooking, jogging, and to read.",
          "She likes cooking, jogging, and reading.",
          "She likes to cook, jogging, and reading.",
          "She likes to cook, to jog, and reading."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'to tergiversate'?",
        options: [
          "To speak clearly",
          "To evade the truth",
          "To travel quickly",
          "To decorate elaborately"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is a common feature of academic writing?",
        options: ["Informal tone", "Slang usage", "Evidence-based arguments", "Personal anecdotes"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which term best describes a 'comprehensive' explanation?",
        options: ["Brief", "Incomplete", "Thorough", "Biased"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What does 'correlation' refer to in statistics?",
        options: ["A calculation method", "A type of error", "A relationship between variables", "A data format"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "What is the purpose of critical thinking?",
        options: ["To memorize facts", "To accept opinions", "To evaluate information", "To create conflict"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which word describes a person who is skeptical of mainstream opinions?",
        options: ["Innovator", "Conformist", "Critic", "Nonconformist"],
        correctAnswer: 3,
      ),
      Question(
        questionText: "What does it mean to 'synthesize' information?",
        options: ["Ignore it", "Memorize it", "Combine ideas to form a whole", "Copy it"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which of the following is most likely to be a 'paradox'?",
        options: ["A logical explanation", "A self-contradictory statement", "A detailed plan", "A historical event"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is the function of a conclusion in an essay?",
        options: ["Introduce new ideas", "Summarize arguments", "Provide references", "Define key terms"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which is an example of a formal expression?",
        options: ["Gonna", "However", "Yeah", "Wanna"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Why do researchers conduct peer reviews?",
        options: ["To promote articles", "To verify quality", "To gain popularity", "To avoid plagiarism"],
        correctAnswer: 1,
      ),
    ],
    'C2': [
      Question(
        questionText: "What does the word 'ubiquitous' mean?",
        options: ["Rare", "Complicated", "Found everywhere", "Expensive"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which situation best illustrates 'cognitive dissonance'?",
        options: ["Feeling joy after a gift", "Feeling discomfort from conflicting beliefs", "Changing opinions over time", "Being bored during a task"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is the implication of using passive voice in academic writing?",
        options: ["It avoids clarity", "It emphasizes the action", "It is too informal", "It reveals the author’s bias"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is meant by 'epistemology'?",
        options: ["Study of space", "Study of history", "Study of knowledge", "Study of emotions"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which sentence contains a metaphor?",
        options: ["The sun rose at 6 a.m.", "Her voice was music to his ears.", "It rained all day.", "He opened the door slowly."],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What is the function of a literature review in research?",
        options: ["To explain methodology", "To summarize prior studies", "To list survey questions", "To present findings"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "Which of the following best defines 'antithesis'?",
        options: ["A repeated phrase", "A contrast of ideas", "A supporting argument", "A definition"],
        correctAnswer: 1,
      ),
      Question(
        questionText: "What does 'tenuous' most closely mean?",
        options: ["Strong", "Weak", "Clear", "Popular"],
        correctAnswer: 1,
      ),

      Question(
        questionText: "Which approach is most suitable for advanced debate?",
        options: ["Guessing", "Memorization", "Evidence-based reasoning", "Avoidance"],
        correctAnswer: 2,
      ),
      Question(
        questionText: "Which sentence uses 'antanaclasis' (a word repeated with different meanings)?",
        options: [
          "Your argument is sound, nothing but sound.",
          "The river flowed like time itself.",
          "She was as busy as a bee.",
          "The stars whispered secrets."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'omphaloskepsis' mean?",
        options: [
          "The study of ancient texts",
          "Contemplation of one's navel as a form of meditation",
          "A surgical procedure",
          "A type of dance"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence demonstrates a 'hypotaxis' structure?",
        options: [
          "I came; I saw; I conquered.",
          "Because it was raining, we stayed indoors, which was fortunate.",
          "The sun rose, the birds sang.",
          "She laughed, cried, then slept."
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "What is the meaning of 'pulchritudinous'?",
        options: [
          "Highly intelligent",
          "Physically beautiful",
          "Extremely wealthy",
          "Terribly cruel"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence uses 'chiasmus'?",
        options: [
          "Ask not what your country can do for you; ask what you can do for your country.",
          "The early bird catches the worm.",
          "She was a hurricane of emotions.",
          "Time is a thief."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'quincunx' refer to?",
        options: [
          "A five-pointed star",
          "An arrangement of five objects with four at the corners and one in the center",
          "A type of poem",
          "A musical instrument"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence is an example of 'aposiopesis' (breaking off mid-sentence)?",
        options: [
          "If you do that again, I’ll—",
          "The world is too much with us; late and soon.",
          "She was the kind of person who would... well, you know.",
          "To be or not to be, that is the question."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'sesquioxidizing'?",
        options: [
          "A chemical reaction involving 1.5 oxygen atoms",
          "A type of exercise routine",
          "A philosophical debate method",
          "A gardening technique"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence uses 'parataxis' (juxtaposition without conjunctions)?",
        options: [
          "I came, I saw, I conquered.",
          "Although it rained, we went out.",
          "She sang because she was happy.",
          "The book, which was old, fell apart."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'epeolatry' mean?",
        options: [
          "Worship of nature",
          "Worship of words",
          "Worship of the sun",
          "Worship of ancestors"
        ],
        correctAnswer: 1, // 2. şık
      ),
      Question(
        questionText: "Which sentence demonstrates 'syllepsis' (a word governing two others in different senses)?",
        options: [
          "She lost her ring and her temper.",
          "The thunder roared and the rain fell.",
          "He was tall, dark, and handsome.",
          "Time flies like an arrow."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'ultracrepidarian'?",
        options: [
          "One who speaks beyond their knowledge",
          "A marathon runner",
          "A type of artist",
          "A scientist who studies light"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence uses 'antanagoge' (balancing a negative with a positive)?",
        options: [
          "The car is old, but it runs perfectly.",
          "She was as brave as a lion.",
          "All the world’s a stage.",
          "The wind whispered through the trees."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'xenization' mean?",
        options: [
          "The act of traveling as a stranger",
          "The study of languages",
          "A medical condition",
          "A type of dance"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence is an example of 'enallage' (intentional grammatical error for effect)?",
        options: [
          "Methinks the lady doth protest too much.",
          "The quicker you work, the better the results.",
          "She sings beautifully.",
          "He run faster than anyone else."
        ],
        correctAnswer: 3, // 4. şık
      ),
      Question(
        questionText: "What is the meaning of 'noctivagant'?",
        options: [
          "Wandering at night",
          "Sleepwalking",
          "Nightmarish",
          "A nocturnal animal"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence uses 'epizeuxis' (repetition for emphasis)?",
        options: [
          "Never, never, never give up.",
          "The sun was a golden coin in the sky.",
          "She was a force of nature.",
          "Time is a river."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What does 'borborygmus' mean?",
        options: [
          "A stomach rumble",
          "A type of bird call",
          "A rhetorical device",
          "A dance move"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Which sentence demonstrates 'hypallage' (transferred epithet)?",
        options: [
          "She had a sleepless night.",
          "The angry wind howled.",
          "He was a lion in battle.",
          "The stars winked mischievously."
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "What is the meaning of 'mugient'?",
        options: [
          "Relating to cows or their sounds",
          "A type of cloud formation",
          "A musical note",
          "A rare gemstone"
        ],
        correctAnswer: 0, // 1. şık
      ),
      Question(
        questionText: "Why is nuance important in communication?",
        options: ["To use simple words", "To avoid detail", "To convey subtle meaning", "To impress others"],
        correctAnswer: 2,
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


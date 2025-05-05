import 'package:flutter/material.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  final List<Map<String, String>> tenses = const [
    {
      'title': 'Present Simple',
      'summary':
      'Used for general truths, habits, and routines.\n'
          'Structure: Subject + V1 (add -s/-es for he/she/it)\n\n'
          'Examples: \n'
          '1. I eat breakfast at 7 AM every day. \n'
          '2. He works at a bank.\n'
          'Negative: She doesn\'t work on weekends.\n'
          'Question: Does he play football every weekend?\n\n'
          'Common adverbs: always, usually, often, sometimes, never',
    },
    {
      'title': 'Present Continuous',
      'summary':
      'Used for actions happening now or temporary situations.\n'
          'Structure: Subject + am/is/are + V-ing\n\n'
          'Examples: \n'
          '1. I am studying right now. \n'
          '2. They are watching a movie.\n'
          'Negative: She isn\'t sleeping at the moment.\n'
          'Question: Are you studying for the exam?\n\n'
          'Common time markers: now, at the moment, currently, this week',
    },
    {
      'title': 'Past Simple',
      'summary':
      'Used for completed actions in the past at a specific time.\n'
          'Structure: Subject + V2 (regular verbs: -ed)\n\n'
          'Examples: \n'
          '1. We traveled to Italy last summer. \n'
          '2. She visited her grandmother yesterday.\n'
          'Negative: They didn\'t go to the concert last night.\n'
          'Question: Did you watch the movie last weekend?\n\n'
          'Common time markers: yesterday, last week, in 2020, ago',
    },
    {
      'title': 'Past Continuous',
      'summary':
      'Used for actions that were ongoing in the past.\n'
          'Structure: Subject + was/were + V-ing\n\n'
          'Examples: \n'
          '1. I was reading a book when you called.\n'
          '2. We were walking in the park at 6 PM.\n'
          'Negative: He wasn\'t studying at that time.\n'
          'Question: Were they working at 9 AM yesterday?\n\n'
          'Often used with: while, when, as, at X o\'clock',
    },
    {
      'title': 'Future Simple (Will)',
      'summary':
      'Used for spontaneous decisions, promises, or predictions.\n'
          'Structure: Subject + will + V1\n\n'
          'Examples: \n'
          '1. I will call you when I arrive.\n'
          '2. It will rain tomorrow.\n'
          'Negative: They won\'t go to the party.\n'
          'Question: Will you join us for dinner tonight?\n\n'
          'Common uses: promises, offers, predictions',
    },
    {
      'title': 'Present Perfect',
      'summary':
      'Used for experiences or actions that occurred in an unspecified time period.\n'
          'Structure: Subject + have/has + V3\n\n'
          'Examples: \n'
          '1. I have lived in Paris for five years.\n'
          '2. She has visited the museum twice.\n'
          'Negative: They haven\'t finished their homework yet.\n'
          'Question: Have you ever been to New York?\n\n'
          'Common markers: ever, never, just, already, yet, since, for',
    },
    {
      'title': 'Past Perfect',
      'summary':
      'Used to describe actions that were completed before another past action.\n'
          'Structure: Subject + had + V3\n\n'
          'Examples: \n'
          '1. He had left before I arrived.\n'
          '2. They had finished the project by the time the deadline came.\n'
          'Negative: She hadn\'t heard about the news.\n'
          'Question: Had you already eaten when I called?\n\n'
          'Common use: with "by the time", "before", "after"',
    },
    {
      'title': 'Future Perfect',
      'summary':
      'Used to express actions that will be completed before a future time.\n'
          'Structure: Subject + will have + V3\n\n'
          'Examples: \n'
          '1. By next month, I will have finished the report.\n'
          '2. They will have left by the time we arrive.\n'
          'Negative: She won\'t have completed the task by tomorrow.\n'
          'Question: Will you have graduated by next year?\n\n'
          'Common markers: by X time, by then, by the time',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purple.shade800,
          foregroundColor: Colors.white,
          title: const Text(
            'Tenses',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.shade50,
                Colors.white,
              ],
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tenses.length,
            itemBuilder: (context, index) {
              final tense = tenses[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Material(
                    color: Colors.white,
                    child: ExpansionTile(
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.purple.shade50,
                      collapsedTextColor: Colors.purple.shade800,
                      textColor: Colors.purple.shade900,
                      iconColor: Colors.purple.shade700,
                      collapsedIconColor: Colors.purple.shade600,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              getTenseIcon(tense['title']!),
                              color: Colors.purple.shade700,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              tense['title']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.purple.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.purple.shade200,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: buildTenseContent(tense['summary']!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  IconData getTenseIcon(String tense) {
    switch (tense) {
      case 'Present Simple':
        return Icons.access_time;
      case 'Present Continuous':
        return Icons.update;
      case 'Past Simple':
        return Icons.history;
      case 'Past Continuous':
        return Icons.timer;
      case 'Future Simple (Will)':
        return Icons.date_range;
      case 'Present Perfect':
        return Icons.check_circle;
      case 'Past Perfect':
        return Icons.check_circle_outline;
      case 'Future Perfect':
        return Icons.access_alarm;
      default:
        return Icons.help_outline;
    }
  }

  List<Widget> buildTenseContent(String summary) {
    return summary.split('\n').map<Widget>((line) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          line,
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
      );
    }).toList();
  }
}

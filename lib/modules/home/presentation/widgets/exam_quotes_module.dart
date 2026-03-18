import 'dart:math';

import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

/// A simple quote model for education and exam related content.
class ExamQuote {
  final String id;
  final String title;
  final String quote;
  final String author;

  const ExamQuote({
    required this.id,
    required this.title,
    required this.quote,
    required this.author,
  });
}

/// A ready-to-use repository with 50 education and exam related quotes.
class ExamQuotesRepository {
  static const List<ExamQuote> quotes = [
    ExamQuote(
      id: 'q1',
      title: 'Purpose of Education',
      quote:
          'Education is the most powerful weapon which you can use to change the world.',
      author: 'Nelson Mandela',
    ),
    ExamQuote(
      id: 'q2',
      title: 'Power of Learning',
      quote:
          'The beautiful thing about learning is that no one can take it away from you.',
      author: 'B. B. King',
    ),
    ExamQuote(
      id: 'q3',
      title: 'Success Through Preparation',
      quote: 'Success is where preparation and opportunity meet.',
      author: 'Bobby Unser',
    ),
    ExamQuote(
      id: 'q4',
      title: 'Courage to Begin',
      quote: 'The expert in anything was once a beginner.',
      author: 'Helen Hayes',
    ),
    ExamQuote(
      id: 'q5',
      title: 'Dreams and Discipline',
      quote:
          'The future belongs to those who believe in the beauty of their dreams.',
      author: 'Eleanor Roosevelt',
    ),
    ExamQuote(
      id: 'q6',
      title: 'Learning Never Ends',
      quote:
          'Live as if you were to die tomorrow. Learn as if you were to live forever.',
      author: 'Mahatma Gandhi',
    ),
    ExamQuote(
      id: 'q7',
      title: 'Value of Knowledge',
      quote: 'An investment in knowledge pays the best interest.',
      author: 'Benjamin Franklin',
    ),
    ExamQuote(
      id: 'q8',
      title: 'Discipline First',
      quote:
          'Success is the sum of small efforts, repeated day in and day out.',
      author: 'Robert Collier',
    ),
    ExamQuote(
      id: 'q9',
      title: 'Keep Moving',
      quote: 'It does not matter how slowly you go as long as you do not stop.',
      author: 'Confucius',
    ),
    ExamQuote(
      id: 'q10',
      title: 'Practice Matters',
      quote:
          'The more that you read, the more things you will know. The more that you learn, the more places you’ll go.',
      author: 'Dr. Seuss',
    ),
    ExamQuote(
      id: 'q11',
      title: 'Today’s Effort',
      quote:
          'Do not wait to strike till the iron is hot; but make it hot by striking.',
      author: 'William Butler Yeats',
    ),
    ExamQuote(
      id: 'q12',
      title: 'Learn Boldly',
      quote:
          'Tell me and I forget. Teach me and I remember. Involve me and I learn.',
      author: 'Benjamin Franklin',
    ),
    ExamQuote(
      id: 'q13',
      title: 'Hard Work Wins',
      quote: 'There are no shortcuts to any place worth going.',
      author: 'Beverly Sills',
    ),
    ExamQuote(
      id: 'q14',
      title: 'Excellence Through Repetition',
      quote:
          'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
      author: 'Will Durant',
    ),
    ExamQuote(
      id: 'q15',
      title: 'Focus on Progress',
      quote: 'Small daily improvements over time lead to stunning results.',
      author: 'Robin Sharma',
    ),
    ExamQuote(
      id: 'q16',
      title: 'Stay Curious',
      quote: 'The mind is not a vessel to be filled but a fire to be ignited.',
      author: 'Plutarch',
    ),
    ExamQuote(
      id: 'q17',
      title: 'Mindset for Success',
      quote: 'Whether you think you can, or you think you can’t—you’re right.',
      author: 'Henry Ford',
    ),
    ExamQuote(
      id: 'q18',
      title: 'No Fear of Failure',
      quote: 'Failure is the opportunity to begin again more intelligently.',
      author: 'Henry Ford',
    ),
    ExamQuote(
      id: 'q19',
      title: 'Effort Builds Confidence',
      quote:
          'Confidence comes not from always being right but from not fearing to be wrong.',
      author: 'Peter T. McIntyre',
    ),
    ExamQuote(
      id: 'q20',
      title: 'One Step at a Time',
      quote: 'A journey of a thousand miles begins with a single step.',
      author: 'Lao Tzu',
    ),
    ExamQuote(
      id: 'q21',
      title: 'Start Now',
      quote: 'The secret of getting ahead is getting started.',
      author: 'Mark Twain',
    ),
    ExamQuote(
      id: 'q22',
      title: 'Persistence Always',
      quote: 'Energy and persistence conquer all things.',
      author: 'Benjamin Franklin',
    ),
    ExamQuote(
      id: 'q23',
      title: 'Consistency Counts',
      quote:
          'Motivation is what gets you started. Habit is what keeps you going.',
      author: 'Jim Ryun',
    ),
    ExamQuote(
      id: 'q24',
      title: 'Growth Through Challenge',
      quote:
          'Challenges are what make life interesting and overcoming them is what makes life meaningful.',
      author: 'Joshua J. Marine',
    ),
    ExamQuote(
      id: 'q25',
      title: 'Aim Higher',
      quote:
          'Shoot for the moon. Even if you miss, you’ll land among the stars.',
      author: 'Norman Vincent Peale',
    ),
    ExamQuote(
      id: 'q26',
      title: 'Be Better Than Yesterday',
      quote: 'Strive for progress, not perfection.',
      author: 'Unknown',
    ),
    ExamQuote(
      id: 'q27',
      title: 'Keep Your Promise to Yourself',
      quote:
          'You don’t have to be great to start, but you have to start to be great.',
      author: 'Zig Ziglar',
    ),
    ExamQuote(
      id: 'q28',
      title: 'Learning Builds Freedom',
      quote:
          'Develop a passion for learning. If you do, you will never cease to grow.',
      author: 'Anthony J. D’Angelo',
    ),
    ExamQuote(
      id: 'q29',
      title: 'Exams Need Effort',
      quote: 'There is no substitute for hard work.',
      author: 'Thomas Edison',
    ),
    ExamQuote(
      id: 'q30',
      title: 'Courage Under Pressure',
      quote: 'Believe you can and you’re halfway there.',
      author: 'Theodore Roosevelt',
    ),
    ExamQuote(
      id: 'q31',
      title: 'Make Time Count',
      quote: 'Lost time is never found again.',
      author: 'Benjamin Franklin',
    ),
    ExamQuote(
      id: 'q32',
      title: 'Be a Lifelong Student',
      quote: 'Learning never exhausts the mind.',
      author: 'Leonardo da Vinci',
    ),
    ExamQuote(
      id: 'q33',
      title: 'Prepare with Intention',
      quote: 'By failing to prepare, you are preparing to fail.',
      author: 'Benjamin Franklin',
    ),
    ExamQuote(
      id: 'q34',
      title: 'Push Beyond Limits',
      quote: 'Success doesn’t come to you, you go to it.',
      author: 'Marva Collins',
    ),
    ExamQuote(
      id: 'q35',
      title: 'Knowledge Opens Doors',
      quote: 'Education is not preparation for life; education is life itself.',
      author: 'John Dewey',
    ),
    ExamQuote(
      id: 'q36',
      title: 'Turn Effort Into Achievement',
      quote: 'The roots of education are bitter, but the fruit is sweet.',
      author: 'Aristotle',
    ),
    ExamQuote(
      id: 'q37',
      title: 'Don’t Quit',
      quote:
          'Perseverance is not a long race; it is many short races one after the other.',
      author: 'Walter Elliot',
    ),
    ExamQuote(
      id: 'q38',
      title: 'Strength in Study',
      quote:
          'The harder you work for something, the greater you’ll feel when you achieve it.',
      author: 'Unknown',
    ),
    ExamQuote(
      id: 'q39',
      title: 'Every Day Matters',
      quote: 'Do something today that your future self will thank you for.',
      author: 'Sean Patrick Flanery',
    ),
    ExamQuote(
      id: 'q40',
      title: 'Think Beyond the Test',
      quote:
          'Education is the passport to the future, for tomorrow belongs to those who prepare for it today.',
      author: 'Malcolm X',
    ),
    ExamQuote(
      id: 'q41',
      title: 'Stay Determined',
      quote: 'Difficulties in life are intended to make us better, not bitter.',
      author: 'Dan Reeves',
    ),
    ExamQuote(
      id: 'q42',
      title: 'Rise After Setbacks',
      quote:
          'Our greatest glory is not in never falling, but in rising every time we fall.',
      author: 'Confucius',
    ),
    ExamQuote(
      id: 'q43',
      title: 'Use Your Potential',
      quote:
          'What lies behind us and what lies before us are tiny matters compared to what lies within us.',
      author: 'Ralph Waldo Emerson',
    ),
    ExamQuote(
      id: 'q44',
      title: 'Learning Creates Possibility',
      quote:
          'Education is simply the soul of a society as it passes from one generation to another.',
      author: 'G. K. Chesterton',
    ),
    ExamQuote(
      id: 'q45',
      title: 'Be Ready',
      quote: 'Opportunity does not waste time with those who are unprepared.',
      author: 'Idowu Koyenikan',
    ),
    ExamQuote(
      id: 'q46',
      title: 'Study with Hope',
      quote:
          'Your education is a dress rehearsal for a life that is yours to lead.',
      author: 'Nora Ephron',
    ),
    ExamQuote(
      id: 'q47',
      title: 'Make It Happen',
      quote: 'The way to get started is to quit talking and begin doing.',
      author: 'Walt Disney',
    ),
    ExamQuote(
      id: 'q48',
      title: 'Wisdom in Effort',
      quote:
          'I am always ready to learn although I do not always like being taught.',
      author: 'Winston Churchill',
    ),
    ExamQuote(
      id: 'q49',
      title: 'Keep Improving',
      quote: 'Don’t let what you cannot do interfere with what you can do.',
      author: 'John Wooden',
    ),
    ExamQuote(
      id: 'q50',
      title: 'Win the Day',
      quote: 'Today a reader, tomorrow a leader.',
      author: 'Margaret Fuller',
    ),
  ];

  static ExamQuote randomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  static List<ExamQuote> shuffledQuotes() {
    final items = List<ExamQuote>.from(quotes);
    items.shuffle();
    return items;
  }
}

class HomeExamQuoteCard extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const HomeExamQuoteCard({
    super.key,
    this.margin,
    this.onTap,
    this.backgroundColor,
  });

  @override
  State<HomeExamQuoteCard> createState() => _HomeExamQuoteCardState();
}

class _HomeExamQuoteCardState extends State<HomeExamQuoteCard> {
  late final ExamQuote selectedQuote;

  @override
  void initState() {
    super.initState();
    // Shuffles once when the widget is first created.
    selectedQuote = ExamQuotesRepository.randomQuote();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: widget.margin ?? const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(16, 16, 30, 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? theme.colorScheme.primaryContainer,
        borderRadius: .only(
          bottomLeft: Radius.circular(40.r),
          topRight: Radius.circular(60.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   selectedQuote.title,
            //   style: theme.textTheme.labelLarge?.copyWith(
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            // const SizedBox(height: 12),
            Text(
              '"${selectedQuote.quote}"',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '— ${selectedQuote.author}',
                textAlign: TextAlign.right,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Optional full screen if you want a dedicated quotes page later.
class ExamQuotesScreen extends StatelessWidget {
  const ExamQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = ExamQuotesRepository.shuffledQuotes();

    return Scaffold(
      appBar: AppBar(title: const Text('Exam Quotes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: quotes.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = quotes[index];

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Text(
                  '"${item.quote}"',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '— ${item.author}',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
USAGE

1. Save this file as:
   lib/modules/home/widgets/exam_quotes_module.dart

2. Import it where needed:
   import 'package:your_app/modules/home/widgets/exam_quotes_module.dart';

3. Place it directly on your home screen:

   class HomeScreen extends StatelessWidget {
     const HomeScreen({super.key});

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: const Text('Home')),
         body: ListView(
           children: const [
             HomeExamQuoteCard(),
           ],
         ),
       );
     }
   }

NOTES
- The quote is bold, which is a very common and readable presentation style.
- The author is placed bottom-right in italic, which is also a common UI pattern.
- A random quote is selected once when the widget is initialized, so it changes on app start/rebuild of a fresh widget instance.
- If you want the quote to change every time the user taps the card, I can give you that version too.
*/

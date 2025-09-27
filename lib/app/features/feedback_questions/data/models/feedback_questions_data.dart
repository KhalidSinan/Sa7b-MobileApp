import 'package:sa7b/app/features/feedback_questions/data/models/feedback_question.dart';

List<FeedbackQuestion> fakeQuestions = [
  FeedbackQuestion(
    id: 'q1',
    question: 'كيف كان مستوى الأسئلة؟',
    type: QuestionType.text,
    isRequired: true,
  ),
  FeedbackQuestion(
    id: 'q2',
    question: 'هل كانت مدة الامتحان كافية؟',
    type: QuestionType.radio,
    options: ['نعم', 'لا', 'إلى حد ما'],
    isRequired: true,
  ),
  FeedbackQuestion(
    id: 'q3',
    question: 'ما العناصر التي ساعدتك أثناء الامتحان؟',
    type: QuestionType.checkbox,
    options: ['الهدوء', 'الأسئلة الواضحة', 'توفر الوقت'],
  ),
];

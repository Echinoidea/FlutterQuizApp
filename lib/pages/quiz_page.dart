import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([ // TODO: Have multiple lists for the different quiz types. "Quiz math_quiz = new Quiz([])", and etc.
    new Question("Mark Zuckerberg is a human", false),
    new Question("Pizza is healthy", true),
    new Question("What is 2 + 2?", true),
    new Question("新しい日の誕生はすごいアルバムです", true),
    new Question("This is a good app", true),
    new Question("'int' is a primitive datatype", true),
    new Question("猫はかわいいです", true),
    new Question("The Pokemon gen 2 remakes are the best", true),
    new Question("Rectangles are squares", false),
    new Question("Lambda expressions are really hard", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is the main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // True button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
            () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}
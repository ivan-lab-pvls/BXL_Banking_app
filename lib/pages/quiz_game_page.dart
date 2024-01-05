import 'dart:math';

import 'package:banking_app/model/answer_item.dart';
import 'package:banking_app/model/question_item.dart';
import 'package:banking_app/pages/final_quiz_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

enum EQuizType { financialLiteracy, bankingProducts, investments }

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({super.key, required this.type});
  final EQuizType type;

  @override
  State<QuizGamePage> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  List<QuestionItem> financialLiteracyItems = [
    QuestionItem(
        title: 'What is the best way to save money?',
        answers: [
          AnswerItem(title: 'Spend less than you earn.', isCorrect: true),
          AnswerItem(title: 'Invest in stocks and bonds.', isCorrect: false),
          AnswerItem(title: 'Take out a loan.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the interest rate on a credit card?',
        answers: [
          AnswerItem(
              title: 'The amount of money you pay back every month.',
              isCorrect: false),
          AnswerItem(
              title: 'The amount of money you borrow.', isCorrect: false),
          AnswerItem(
              title: ' The amount of money you pay to borrow money.',
              isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is a budget?',
        answers: [
          AnswerItem(
              title: 'A plan for how you will spend your money.',
              isCorrect: true),
          AnswerItem(title: 'A list of all your expenses.', isCorrect: false),
          AnswerItem(title: 'A way to track your spending.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is a 401(k)?',
        answers: [
          AnswerItem(
              title: 'A retirement savings plan offered by employers.',
              isCorrect: true),
          AnswerItem(title: 'A type of investment account.', isCorrect: false),
          AnswerItem(title: 'A way to save for retirement.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is a credit score?',
        answers: [
          AnswerItem(
              title:
                  'A number that lenders use to assess your creditworthiness.',
              isCorrect: true),
          AnswerItem(
              title: 'A number that tracks your spending habits.',
              isCorrect: false),
          AnswerItem(
              title: 'A number that tracks your savings habits.',
              isCorrect: false),
        ],
        isCompleted: false),
  ];
  List<QuestionItem> bankingProductsItems = [
    QuestionItem(
      title: 'Which of the following is not a type of bank account?',
      answers: [
        AnswerItem(title: 'Savings account', isCorrect: false),
        AnswerItem(title: 'Checking account', isCorrect: false),
        AnswerItem(title: 'Mortgage', isCorrect: true),
      ],
    ),
    QuestionItem(
      title: 'What is the interest rate on a savings account?',
      answers: [
        AnswerItem(
            title: 'It depends on the bank and the type of account.',
            isCorrect: true),
        AnswerItem(title: 'It is always positive.', isCorrect: false),
        AnswerItem(title: 'It is always negative.', isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is the interest rate on a savings account?',
      answers: [
        AnswerItem(title: 'Usually low', isCorrect: true),
        AnswerItem(title: 'Usually high', isCorrect: false),
        AnswerItem(title: 'Usually variable', isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is a mortgage?',
      answers: [
        AnswerItem(
            title: 'It is a loan that is used to buy a home.', isCorrect: true),
        AnswerItem(
            title: 'It is a loan that is used to finance a business.',
            isCorrect: false),
        AnswerItem(
            title: 'It is a loan that is used to buy a car.', isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is a bank statement?',
      answers: [
        AnswerItem(
            title:
                'It is a document that lists all of your transactions for a specific period of time.',
            isCorrect: true),
        AnswerItem(
            title: 'It is a document that lists all of your debts.',
            isCorrect: false),
        AnswerItem(
            title: 'It is a document that lists all of your assets.',
            isCorrect: false),
      ],
    ),
  ];
  List<QuestionItem> investmentsItems = [
    QuestionItem(
      title: 'What is the goal of investing?',
      answers: [
        AnswerItem(title: 'To make money', isCorrect: true),
        AnswerItem(title: 'To save money', isCorrect: false),
        AnswerItem(title: 'To lose money', isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is a stock?',
      answers: [
        AnswerItem(title: 'A share of ownership in a company', isCorrect: true),
        AnswerItem(
            title: 'A debt instrument issued by a company', isCorrect: false),
        AnswerItem(
            title: 'A type of investment that is not risky', isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is a mutual fund?',
      answers: [
        AnswerItem(
            title: 'A type of investment that pools money from many investors',
            isCorrect: true),
        AnswerItem(
            title: 'A type of investment that is not risky', isCorrect: false),
        AnswerItem(
            title: 'A type of investment that is managed by a professional',
            isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is a bond?',
      answers: [
        AnswerItem(
            title: 'A type of investment that pays a fixed interest rate',
            isCorrect: true),
        AnswerItem(
            title: 'A type of investment that is not risky', isCorrect: false),
        AnswerItem(
            title: 'A type of investment that is managed by a professional',
            isCorrect: false),
      ],
    ),
    QuestionItem(
      title: 'What is the riskiest type of investment?',
      answers: [
        AnswerItem(title: 'Stocks', isCorrect: true),
        AnswerItem(title: 'Bonds', isCorrect: false),
        AnswerItem(title: 'Mutual funds', isCorrect: false),
      ],
    ),
  ];
  List colors = [
    const Color(0xFFE334FF),
    const Color(0xFF3B4DF0),
    const Color(0xFFA045FB),
    const Color(0xFFF475B2),
  ];
  List<String> images = [
    'assets/banking1.jpeg',
    'assets/money1.jpg',
    'assets/money2.jpg',
    'assets/money3.jpg',
    'assets/money4.png',
    'assets/money5.jpg',
    'assets/money6.png',
    'assets/money7.jpg',
  ];

  int index = 0;

  int questionNumber = 0;
  QuestionItem currentQuestion = QuestionItem();
  int correctAnswers = 0;
  String currentImage = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, QuestionItem> quastionMap = {};
    if (widget.type == EQuizType.financialLiteracy) {
      quastionMap = financialLiteracyItems.asMap();
    } else if (widget.type == EQuizType.bankingProducts) {
      quastionMap = bankingProductsItems.asMap();
    } else if (widget.type == EQuizType.investments) {
      quastionMap = investmentsItems.asMap();
    }
    quastionMap.forEach((key, value) {
      if (key == questionNumber) {
        currentQuestion = value;
        int first = Random().nextInt(3);
        int second = Random().nextInt(3);
        if (currentQuestion.isCompleted == false ||
            currentQuestion.isCompleted == null) {
          currentImage = images[Random().nextInt(8)];
          currentQuestion.answers!.swap(first, second);
        }
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 37),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            LinearPercentIndicator(
                              width: 120.0,
                              barRadius: const Radius.circular(7),
                              lineHeight: 8.0,
                              percent: 0.2 * (questionNumber + 1),
                              progressColor: const Color(0xFFF475B2),
                            ),
                            Text(
                              '${questionNumber + 1}/5',
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    currentImage,
                                  ))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              currentQuestion.title!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: currentQuestion.isCompleted == null ||
                              !currentQuestion.isCompleted!
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.zero,
                      child: getAnswers(),
                    ),
                  ],
                ),
              ),
              if (currentQuestion.isCompleted != null &&
                  currentQuestion.isCompleted!)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
                  child: InkWell(
                    onTap: () {
                      if (questionNumber < 4) {
                        questionNumber++;
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => FinalQuizPage(
                                    score: correctAnswers,
                                  )),
                        );
                      }
                      setState(() {});
                    },
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF475B2),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
            ],
          ),
          if (currentQuestion.isCompleted != null &&
              currentQuestion.isCompleted!)
            Container(
              width: double.infinity,
              height: 215,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: currentQuestion.isCorrect != null
                      ? currentQuestion.isCorrect!
                          ? const Color(0xFF3ED684)
                          : const Color(0xFFE35454)
                      : const Color(0xFF3ED684)),
              child: currentQuestion.isCorrect!
                  ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Correct!',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'That was good',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ])
                  : Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text(
                          'Incorrect!',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'That was close',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
            )
        ],
      ),
    );
  }

  Widget getAnswers() {
    List<Widget> list = [];

    for (var answer in currentQuestion.answers!) {
      list.add(InkWell(
        onTap: () {
          if (currentQuestion.isCompleted == null ||
              currentQuestion.isCompleted == false) {
            currentQuestion.isCompleted = true;
            if (answer.isCorrect!) {
              correctAnswers++;
            }
            currentQuestion.isCorrect = answer.isCorrect;
            setState(() {});
          }
        },
        child: Container(
          height: 122,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width / 2 - 25,
          decoration: BoxDecoration(
              color: currentQuestion.isCompleted != null
                  ? currentQuestion.isCompleted!
                      ? answer.isCorrect!
                          ? Colors.green
                          : Colors.red
                      : colors[Random().nextInt(colors.length)]
                  : colors[Random().nextInt(colors.length)],
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                answer.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ));
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: list,
    );
  }
}

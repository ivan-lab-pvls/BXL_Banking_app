import 'package:banking_app/pages/quiz_game_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.callBack});
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(18, 60, 18, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quiz',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 32)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text('Test your knowledge of finance',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16)),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const QuizGamePage(
                        type: EQuizType.financialLiteracy,
                      )),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset('assets/financial_literacy.png'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Financial literacy',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFF475B2),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Checking the basics to keep your budget in check',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const QuizGamePage(
                        type: EQuizType.bankingProducts,
                      )),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset('assets/banking_products.png'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Banking products',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFF475B2),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Checking the basics to keep your budget in check',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const QuizGamePage(
                        type: EQuizType.investments,
                      )),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset('assets/investments.png'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Investments',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFF475B2),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            'Checking the basics to keep your budget in check',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

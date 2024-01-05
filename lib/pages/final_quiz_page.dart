import 'package:flutter/material.dart';

class FinalQuizPage extends StatelessWidget {
  const FinalQuizPage({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 60, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Score',
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
                      child: score == 5
                          ? Text('You\'re pretty good with finances',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 16))
                          : score == 4
                              ? Text('That was close.',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.3),
                                      fontSize: 16))
                              : Text('Try next time. It will be better!',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.3),
                                      fontSize: 16)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset('assets/final_quiz_image.png'),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$score/5',
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF475B2),
                                fontSize: 18),
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: score == 5
                                      ? Text(
                                          'You have successfully answered all the questions, way to go!',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      : score == 4
                                          ? Text(
                                              'You almost answered all the questions, way to go!',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            )
                                          : score == 0
                                              ? Text(
                                                  'Try next time!',
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                )
                                              : Text(
                                                  'It was close, try next time!',
                                                  style: TextStyle(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w400,
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
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF475B2),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Go to quiz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

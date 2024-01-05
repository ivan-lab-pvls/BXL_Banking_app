import 'package:banking_app/main.dart';
import 'package:banking_app/pages/home_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Column(children: [
          if (page.value == 0)
            Padding(
              padding: const EdgeInsets.only(top: 77),
              child: Image.asset('assets/first_onBoarding_image.png'),
            ),
          if (page.value == 1)
            Padding(
              padding: const EdgeInsets.only(top: 77),
              child: Image.asset('assets/second_onBoarding_image.png'),
            ),
          if (page.value == 2)
            Padding(
              padding: const EdgeInsets.only(top: 77),
              child: Image.asset('assets/third_onBoarding_image.png'),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 11, 11),
            child: Column(children: [
              if (page.value == 0)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12, top: 38),
                  child: Text(
                    'Welcome to banking app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              if (page.value == 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Greetings in our mobile app! Manage your finances, read news, and test your financial knowledge with quizzes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              if (page.value == 1)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12, top: 38),
                  child: Text(
                    'Manage your income',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              if (page.value == 1)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    'Calculate income, track expenses, and handle accounts with convenient graphs and reports.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              if (page.value == 2)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12, top: 38),
                  child: Text(
                    ' Education',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              if (page.value == 2)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    'Take engaging financial quizzes, read fresh news in our app. Welcome to our app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: page,
                      builder: (context, index, child) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: page.value,
                          decorator: DotsDecorator(
                            size: const Size(20.0, 4.0),
                            activeSize: const Size(40.0, 4.0),
                            spacing: const EdgeInsets.all(3),
                            color: Colors.white.withOpacity(0.24),
                            activeColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 18),
                child: InkWell(
                  onTap: () {
                    if (page.value == 0) {
                      page.value = 1;
                      setState(() {});
                    } else if (page.value == 1) {
                      page.value = 2;
                      setState(() {});
                    } else if (page.value == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF475B2),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Terms of use  |  Privacy Policy',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }

  Widget getStars() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 16,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }
}

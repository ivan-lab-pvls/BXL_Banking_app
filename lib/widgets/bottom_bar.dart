import 'package:banking_app/main.dart';
import 'package:banking_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar(
      {super.key, required this.callBack, this.fromCocktailPage = false});
  final VoidCallback callBack;
  final bool fromCocktailPage;

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              page = EPageOnSelect.homePage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.homePage
                        ? Image.asset(
                            'assets/icons/Home.png',
                            color: const Color(0xFFF475B2),
                          )
                        : Image.asset(
                            'assets/icons/Home.png',
                            color:
                                Colors.white.withOpacity(0.7).withOpacity(0.7),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Home',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: page == EPageOnSelect.homePage
                                  ? const Color(0xFFF475B2)
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.incomePage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 70,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.incomePage
                        ? Image.asset(
                            'assets/icons/Money.png',
                            color: const Color(0xFFF475B2),
                          )
                        : Image.asset(
                            'assets/icons/Money.png',
                            color:
                                Colors.white.withOpacity(0.7).withOpacity(0.7),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Income',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: page == EPageOnSelect.incomePage
                                  ? const Color(0xFFF475B2)
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.newsPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 70,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.newsPage
                        ? Image.asset(
                            'assets/icons/News.png',
                            color: const Color(0xFFF475B2),
                          )
                        : Image.asset(
                            'assets/icons/News.png',
                            color:
                                Colors.white.withOpacity(0.7).withOpacity(0.7),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('News',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: page == EPageOnSelect.newsPage
                                  ? const Color(0xFFF475B2)
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.quizPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.quizPage
                        ? Image.asset(
                            'assets/icons/Entertainment.png',
                            color: const Color(0xFFF475B2),
                          )
                        : Image.asset(
                            'assets/icons/Entertainment.png',
                            color:
                                Colors.white.withOpacity(0.7).withOpacity(0.7),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Quiz',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: page == EPageOnSelect.quizPage
                                  ? const Color(0xFFF475B2)
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.settingsPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.settingsPage
                        ? Image.asset(
                            'assets/icons/Settings.png',
                            color: const Color(0xFFF475B2),
                          )
                        : Image.asset(
                            'assets/icons/Settings.png',
                            color:
                                Colors.white.withOpacity(0.7).withOpacity(0.7),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Settings',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: page == EPageOnSelect.settingsPage
                                  ? const Color(0xFFF475B2)
                                  : Colors.white.withOpacity(0.7),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

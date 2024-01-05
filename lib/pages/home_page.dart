import 'dart:convert';

import 'package:banking_app/model/Income_item.dart';
import 'package:banking_app/model/news_item.dart';
import 'package:banking_app/pages/description_news_page.dart';
import 'package:banking_app/pages/enter_income.dart';
import 'package:banking_app/pages/income_page.dart';
import 'package:banking_app/pages/news_page.dart';
import 'package:banking_app/pages/quiz_page.dart';
import 'package:banking_app/pages/settings_page.dart';
import 'package:banking_app/widgets/bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum EPageOnSelect { homePage, incomePage, newsPage, settingsPage, quizPage }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

EPageOnSelect page = EPageOnSelect.homePage;

class _HomePageState extends State<HomePage> {
  List<NewsItem> newsList = [
    NewsItem(
      title: 'European Stocks Fall Ahead of Key US Jobs Data: Markets Wrap',
      type: ENewsType.recent,
      text:
          'TOKYO (AP) — Global shares retreated on Friday although export-related Tokyo stocks got a boost as the dollar strengthened against the Japanese yen. U.S. futures edged lower while oil prices rose nearly \$1. Investors are awaiting the release of a comprehensive report on the jobs market from the U.S. Labor Department later Friday. Economists expect it to show U.S. hiring slowed to 160,000 jobs last month from 199,000 in November. The hope is that the economy will remain just strong enough to stave off recession without reversing progress in taming inflation. The Federal Reserve is watching to see if current trends continue as it weighs the possibility of cutting interest rates. Rate cuts give a boost to prices for stocks and other investments, while also relaxing the pressure on the economy and financial system. “Sentiments are back on some wait-and-see, given that we may have to see a substantial weakening of the U.S. labor market to justify market pricing of a rate cut,” said Yeap Jun Rong, market analyst at IG. France’s CAC 40 declined nearly 0.7% to 7,401.13. Germany’s DAX slipped 0.5% to 16,532.37, while Britain’s FTSE 100 dropped 0.6% to 7,677.77. The futures for the S&P 500 and the Dow Jones Industrial Average were down 0.1%. In Asian trading, Japan’s benchmark Nikkei 225 added 0.3% to finish at 33,377.42 as major manufacturers like Toyota Motor Corp. advanced thanks to a weakening of the yen, which helps Japanese exporters by boosting the value of their overseas earnings.',
      date: '01/05/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/NRVYX0PYfwCdqA4Jf1eLjA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/ap_finance_articles_694/8f2724361988ff2ec8a6934c4e8c39b9',
    ),
    NewsItem(
      title: 'Marketmind: Stocks\' win streak falls prey to rethink on Fed',
      type: ENewsType.recent,
      text:
          'By Kevin Buckland A look at the day ahead in European and global markets from Kevin Buckland The story of 2024 thus far has been an aggressive repricing of dovish Federal Reserve bets. The effect on markets has been a slide in global equities and a bounce in the dollar, setting up the former for its first losing week in 10 and the latter for its best week since mid-July. The monthly U.S. payrolls report due later in the day had already loomed large, but its significance has been ratcheted up after data overnight provided even more evidence of labour market resilience, easing pressure on the Fed to rush to cut rates. Traders now see a little better than 2-in-3 odds that the Fed cuts rates by March, down from a 71% probability a week earlier, according to the CME Group\'s Fedwatch tool. Where the dollar has been particularly strong is against the yen, both because of the climb back to 4% for long-term Treasury yields and with the deadly New Year\'s Day quake on the Japan Sea coast forcing the last wagers for a hawkish Bank of Japan policy shift this month off the table. Analysts don\'t see the disaster as having a huge economic impact, but at the very least, policy makers who had already been sounding dovish will want to see how recovery efforts progress before tightening financial conditions. Britain gets house price data, a day after strong consumer lending figures bolstered bets the economy can skirt a recession, lifting sterling further off the three-week trough from Tuesday that had been caused by tepid inflation figures.',
      date: '01/05/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/0B8aYnyd.TGvIRaPt5rqTg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQyNA--/https://media.zenfs.com/en/reuters-finance.com/7933c877f4c2a363f23d051085c2763a',
    ),
  ];
  List<IncomeItem> incomes = [];
  int hours = DateTime.now().hour;
  @override
  void initState() {
    super.initState();
    getShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: getContent(),
    );
  }

  Widget getContent() {
    if (page == EPageOnSelect.homePage) {
      return Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 60, 18, 30),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFFF475B2), Color(0xFF831ED2)]),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              hours >= 1 && hours <= 12
                                  ? 'Good morning'
                                  : hours >= 12 && hours <= 16
                                      ? "Good Afternoon"
                                      : hours >= 16 && hours <= 21
                                          ? "Good Evening"
                                          : "Good Night",
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          const Text(
                            'Amount income',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${getIncome().toStringAsFixed(0)} \$',
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white),
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'News',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          page = EPageOnSelect.newsPage;
                          setState(() {});
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFF475B2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: getNews(),
                )))
              ],
            ),
          ),
          BottomBar(callBack: () {
            setState(() {});
          })
        ],
      );
    } else if (page == EPageOnSelect.settingsPage) {
      return Column(
        children: [
          const Expanded(child: SettingsPage()),
          BottomBar(callBack: () {
            setState(() {});
          })
        ],
      );
    } else if (page == EPageOnSelect.incomePage) {
      return IncomePage(
        incomesCallBack: (incomesItems) {
          incomes = incomesItems;
          setState(() {});
        },
        callBack: () {
          setState(() {});
        },
      );
    } else if (page == EPageOnSelect.newsPage) {
      return Column(
        children: [
          Expanded(child: NewsPage(callBack: () {
            setState(() {});
          })),
          BottomBar(callBack: () {
            setState(() {});
          })
        ],
      );
    } else if (page == EPageOnSelect.quizPage) {
      return Column(
        children: [
          Expanded(child: QuizPage(callBack: () {
            setState(() {});
          })),
          BottomBar(callBack: () {
            setState(() {});
          })
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionNewsPage(
                      news: news,
                      callBack: () {
                        setState(() {});
                      },
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: const Color(0xFF2B2B2B),
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  height: 78,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            news.image!,
                          ))),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                news.title!,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: Text(
                news.text!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.3)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  news.date!,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.3)),
                )
              ],
            )
          ]),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  double getIncome() {
    double totalInocme = 0.0;
    for (var income in incomes) {
      totalInocme = totalInocme + income.cost!;
    }
    return totalInocme;
  }

  void getShared() async {
    final prefs = await SharedPreferences.getInstance();

    final List<dynamic> jsonData =
        jsonDecode(prefs.getString('incomeList') ?? '[]');

    incomes = jsonData.map<IncomeItem>((jsonList) {
      {
        return IncomeItem.fromJson(jsonList);
      }
    }).toList();
    setState(() {});
  }
}

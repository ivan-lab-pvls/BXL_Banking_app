import 'package:banking_app/model/news_item.dart';
import 'package:banking_app/pages/description_news_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key, required this.callBack});
  final Function callBack;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int tagNumber = 0;
  List<String> options = [
    'All',
    'Recent',
    'Popular',
    'Interestings',
  ];
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
    NewsItem(
      title:
          'UN economic forecast cites conflicts, sluggish trade, high interest and climate disasters',
      type: ENewsType.recent,
      text:
          'UNITED NATIONS (AP) — The United Nations issued a somber global economic forecast for 2024 on Thursday, pointing to challenges from escalating conflicts, sluggish global trade, persistently high interest rates and increasing climate disasters. In its flagship economic report, the U.N. projected that global economic growth would slow to 2.4% this year from an estimated 2.7% in 2023, which exceeds expectations. But both are still below the 3% growth rate before the COVID-19 pandemic began in 2020, it said. The U.N. forecast is lower than those of the International Monetary Fund in October and the Organization for Economic Cooperation and Development in late November. The IMF said it expects global growth to slow from an expected 3% in 2023 to 2.9% in 2024. The Paris-based OECD, comprising 38 mainly developed countries, estimated that international growth would also slow from an expected 2.9% in 2023 to 2.7% in 2024. The U.N.’s report -- World Economic Situation and Prospects 2024 -- warned that the prospects of prolonged tighter credit conditions and higher borrowing costs present “strong headwinds” for a world economy saddled with debt, especially in poorer developing countries, and needing investment to resuscitate growth.Shantanu Mukherjee, director of the U.N.’s Economic Analysis and Policy Division, said fears of a recession in 2023 were averted mainly due to the United States, the world’s largest economy, curbing high inflation without putting the brakes on the economy. But he told a news conference launching the report: “We’re still not out of the danger zone.”',
      date: '01/05/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/xDuQvmbclxqZEi5Hy6_VZQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://media.zenfs.com/en/ap_finance_articles_694/268fe732dc3d4736409eae132ed2fbb1',
    ),
    NewsItem(
      title:
          'Wall Street banks push back expected end of Fed balance sheet drawdown',
      type: ENewsType.recent,
      text:
          'NEW YORK (Reuters) - Wall Street\'s biggest banks shifted ahead of last month\'s Federal Reserve meeting toward predicting the U.S. central bank would end its balance sheet reduction process later this year than previously thought, according to a survey released on Thursday by the New York Fed. Banks, referred to as primary dealers, now believe the process known as quantitative tightening, or QT, will end in the fourth quarter, according to a poll taken ahead of the Fed\'s Dec. 12-13 policy meeting. In the primary dealer survey done ahead of the policy meeting that ended on Nov. 1, the banks collectively viewed the third quarter as the stopping point for QT. If the dealers are right, the Fed\'s balance sheet will contract to \$6.75 trillion from the current level of about \$7.764 trillion. The dealers also predicted ahead of the December meeting that there would be \$375 billion in the central bank\'s reverse repo facility when QT ended, versus the expected \$625 billion in the October survey. In the December survey, respondents said they expected bank reserves to be at \$3.125 trillion at the end of QT, versus \$2.875 trillion in the prior poll.',
      date: '01/05/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/21yKWUo2hew7IkER4VCOfg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/reuters-finance.com/3ee63ae5b9cd35d447164b3a2c231987',
    ),
    NewsItem(
      title:
          '\'Slightly hawkish\' Banxico calls for caution on rates as inflation still sticky',
      type: ENewsType.popular,
      text:
          'MEXICO CITY (Reuters) -Most members of the Bank of Mexico\'s governing board called for caution as the central bank of Latin America\'s No. 2 economy eyes possible rate cuts in the new year, minutes from its last monetary policy meeting showed on Thursday. The minutes from the Dec. 14 meeting showed the five-member board agreed that Mexico\'s benchmark interest rate should be held at its current all-time high for "some time" in order to bring inflation down to the official target. The Bank of Mexico, known as Banxico, unanimously decided to keep its key rate at 11.25% for a sixth straight time at the December meeting amid sticky inflation. After peaking in the third quarter of 2022, Mexican annual inflation has fallen steadily, reaching its lowest level since February 2021 in October although it ticked up in November and again in early December. Most of the board agreed during the meeting that while inflation is expected to reach the bank\'s 3% target in the second quarter of 2025, the outlook for rising consumer prices still poses challenges. In particular, board members pointed to a more gradual slowing of food and services inflation, which influenced the board\'s decision to revise headline inflation forecasts upward for some quarters. In Thursday\'s minutes, four members of the board said caution must be exercised when evaluating or communicating monetary policy changes, with the fifth expressing the view that lowering the key lending rate could begin to be discussed at the bank\'s next meetings.',
      date: '01/05/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/wAIqEyLGE.eeosKBAIggrA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3Mw--/https://media.zenfs.com/en/reuters-finance.com/b9aa31c9e11627e592a8a4f39d6cee66',
    ),
    NewsItem(
      title: 'French Inflation Inches Higher on Energy, Services Costs',
      type: ENewsType.interesting,
      text:
          '(Bloomberg) -- French inflation edged higher in December as service prices grew more quickly and energy costs jumped after the government pared back support for households. The 4.1% annual reading was higher than November’s 3.9%, data released Thursday showed. It was in line with the median estimate in a Bloomberg survey of analysts and remains well below the 7.3% peak notched in February 2023. On a monthly basis, prices rose 0.1% — less than economists expected, though exceeding the previous month’s negative figure. The euro zone’s No. 2 economy is experiencing a similar uptick in inflation to the rest of the region — though the European Central Bank is unlikely to worry unduly. Price gains in the 20-nation bloc have cooled dramatically of late, with the 2% target coming back into sight in November. That prompted investors to scale up bets that interest rates will be lowered sooner than the middle of 2024, as some ECB officials have been signaling. Money markets point to 166 basis points of easing by year-end — equivalent to more than six quarter-point cuts. As recently as late November, just three such reductions were priced for 2024.',
      date: '01/04/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/aziFTKfnvf26.ez1CAWNgg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTM5Nw--/https://media.zenfs.com/en/bloomberg_markets_842/1573f1e522086ac059c8d9fb5c276af6',
    ),
    NewsItem(
      title: 'South Korea sees slower economic recovery, inflation cooldown',
      type: ENewsType.popular,
      text:
          'SEOUL (Reuters) - South Korea\'s government will put its focus on supporting people\'s livelihoods and managing risk factors, as it cut the country\'s 2024 GDP forecast and raised its inflation projection. In its biannual economic policy plan released on Thursday, the finance ministry expected the economy to grow 2.2% in 2024, down from 2.4% seen in July, after expanding 1.4% in 2023 which was a three-year low. The ministry expected consumer prices to rise 2.6% this year, up from its previous forecast of 2.3%. In 2023, prices rose 3.6%. "The economic recovery will be stronger (than last year) amid improvements in global trade and demand for semiconductors, but there will be difficulties in domestic demand and people\'s livelihoods due to persistently high inflation and interest rates," the ministry said. The government will primarily focus on economic recovery for the common people, while managing potential risk factors, it said. South Korea\'s exports rose for a third straight month in December as demand for chips started to pick up, raising hopes for an economic recovery driven by semiconductor exports. The country\'s central bank has maintained its policy interest rate at 3.5%, the highest since late 2008, since the last hike in January 2023, in its continued fight against slowly easing, but still high inflation. The finance ministry said it aims to bring down inflation, which stood at 3.2% in December, to the 2% level within the first half of 2024, with more policy measures, such as tax and tariff cuts, and freezing public utility costs.',
      date: '01/04/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/rmfIwSjZA6TTa3UlGOIfvw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTQ3MA--/https://media.zenfs.com/en/reuters-finance.com/b133b73462ecd326360cfda466d74586',
    ),
    NewsItem(
      title: 'White House warns Red Sea turmoil could hit US economy',
      type: ENewsType.interesting,
      text:
          'WASHINGTON — The White House has warned that the potential for higher shipping costs to affect the U.S. economy amid diversion of ships from the Red Sea will depend on how long Houthi rebels sustain their attacks on commercial vessels. “If we weren’t concerned, we wouldn’t have stood up an operation in the Red Sea, now consisting of more than 20 nations, to try to protect that commerce,” White House spokesman John Kirby said at a White House press conference on Wednesday, referring to the U.S.-led military force Operation Prosperity Guardian. “The Red Sea is a vital waterway, and a significant amount of global trade flows through it. By forcing nations to go around the Cape of Good Hope, you’re adding weeks and weeks onto voyages, and untold resources and expenses have to be applied in order to do that. So obviously there’s a concern about the impact on global trade.” Asked if those impacts will become a “pocketbook” issue for Americans, Kirby responded that the administration is not yet seeing that. Asked if those impacts will become a “pocketbook” issue for Americans, Kirby responded that the administration is not yet seeing that. “It would depend on how long this threat goes and on how much more energetic the Houthis think they might become,” he said. “Right now we haven’t seen an uptick or a specific effect on the U.S. economy. But make no mistake. This is a key international waterway. Countries more and more are becoming aware of this increasing threat to the free flow of commerce.',
      date: '01/04/2024',
      image:
          'https://s.yimg.com/ny/api/res/1.2/o4nGbvT3zpfAEQNyyuiA7w--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTM5NA--/https://media.zenfs.com/en/freightwaves_373/375f726322741df93e11759d85ff065d',
    )
  ];
  ENewsType filterType = ENewsType.all;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('News',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 32)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                    'Read financial news to stay up-to-date on current events',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 16)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ChipsChoice<int>.single(
              choiceStyle: C2ChipStyle.filled(
                  borderRadius: BorderRadius.circular(9),
                  foregroundStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF979797),
                      fontSize: 14),
                  color: Colors.white,
                  backgroundOpacity: 0.15,
                  checkmarkColor: Colors.white,
                  hoveredStyle: C2ChipStyle.filled(
                    color: const Color(0xFFF475B2),
                  ),
                  selectedStyle: C2ChipStyle.filled(
                      color: const Color(0xFFF475B2),
                      foregroundStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14))),
              value: tagNumber,
              onChanged: (val) => setState(() => tagNumber = val),
              choiceItems: C2Choice.listFrom<int, String>(
                source: options,
                value: (i, v) => i,
                label: (i, v) => v,
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [getNews()],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    List<NewsItem> filteredNews = [];
    if (tagNumber == 0) {
      filteredNews = newsList;
    } else if (tagNumber == 1) {
      filteredNews = newsList
          .where((element) => element.type == ENewsType.recent)
          .toList();
    } else if (tagNumber == 2) {
      filteredNews = newsList
          .where((element) => element.type == ENewsType.popular)
          .toList();
    } else if (tagNumber == 3) {
      filteredNews = newsList
          .where((element) => element.type == ENewsType.interesting)
          .toList();
    }
    for (var news in filteredNews) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionNewsPage(
                      news: news,
                      callBack: () {
                        widget.callBack();
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
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
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
                      fontSize: 14,
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
}

import 'package:banking_app/model/news_item.dart';
import 'package:banking_app/widgets/bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DescriptionNewsPage extends StatelessWidget {
  const DescriptionNewsPage(
      {super.key, required this.callBack, required this.news});
  final Function callBack;
  final NewsItem news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 60, 18, 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                  child: Text(
                    news.title!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
                  child: Container(
                    height: 178,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(news.image!))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        news.date!,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    news.text!,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ]),
            ),
          ),
          BottomBar(callBack: () {
            Navigator.pop(context);
            callBack();
          })
        ],
      ),
    );
  }
}

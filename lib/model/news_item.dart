enum ENewsType { all, recent, popular, interesting }

class NewsItem {
  String? title;
  String? image;
  String? text;
  String? date;
  ENewsType? type;

  NewsItem({this.title, this.image, this.text, this.date, this.type});
}

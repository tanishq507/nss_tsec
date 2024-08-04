class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/1.jpeg",
    title: "NSS-TSEC",
    subTitle: "IT'S YOU NOT ME",
  ),
];

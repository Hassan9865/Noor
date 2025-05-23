class CardItem {
  final String title;
  final String image;

  CardItem({required this.title, required this.image});
}

final List<CardItem> cardItem = [
  CardItem(title: 'Prayer Time', image: 'assets/card_icon/prayer_time.png'),
  CardItem(title: 'Hadees-e-Pak', image: 'assets/card_icon/hadees.png'),
  CardItem(title: 'Tasbih', image: 'assets/card_icon/tasbih.png'),
  CardItem(title: 'Dua', image: 'assets/card_icon/dua.png'),
  CardItem(title: 'Qibla Direction', image: 'assets/card_icon/qibla.png'),
  CardItem(title: 'Learn Quran', image: 'assets/card_icon/quran.png'),
  CardItem(title: 'Zakat Calculator', image: 'assets/card_icon/zakat.png'),
  CardItem(title: '6 Kalma', image: 'assets/card_icon/kalma.png'),
];

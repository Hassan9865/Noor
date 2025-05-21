import 'package:stacked/stacked.dart';

class Kalma {
  final String title;
  final String arabic;
  final String meaning;
  Kalma(this.title, this.arabic, this.meaning);
}

class KalmaViewmodel extends BaseViewModel {
  int counter = 0;
  int _currentIndex = 0;

  final List<Kalma> _kalmaList = [
    Kalma(
      "First Kalima (Tayyab)",
      "لَا إِلٰهَ إِلَّا اللّٰهُ مُحَمَّدٌ رَسُوْلُ اللّٰهِ",
      "There is no god but Allah, Muhammad is the Messenger of Allah.",
    ),
    Kalma(
      "Second Kalima (Shahadat)",
      "أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُوْلُهُ",
      "I bear witness that there is no god but Allah, the One and Only, without partner; and I bear witness that Muhammad is His servant and Messenger.",
    ),
    Kalma(
      "Third Kalima (Tamjeed)",
      "سُبْحَانَ اللّٰهِ، وَالْحَمْدُ لِلّٰهِ، وَلَا إِلٰهَ إِلَّا اللّٰهُ، وَاللّٰهُ أَكْبَرُ. وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ الْعَلِيِّ الْعَظِيْمِ",
      "Glory is for Allah, all praise is for Allah, there is no god but Allah, and Allah is the Greatest. There is no power and no strength except with Allah, the Most High, the Most Great.",
    ),
    Kalma(
      "Fourth Kalima (Tawheed)",
      "لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيْتُ، وَهُوَ حَيٌّ لَا يَمُوْتُ أَبَدًا أَبَدًا، ذُو الْجَلَالِ وَالْإِكْرَامِ، بِيَدِهِ الْخَيْرُ، وَهُوَ عَلٰى كُلِّ شَيْءٍ قَدِيْرٌ",
      "There is no god but Allah. He is One, He has no partner. His is the Kingdom and for Him is all praise. He gives life and causes death. He is alive and will never die. Possessor of majesty and honor. In His hand is all good, and He has power over everything.",
    ),
    Kalma(
      "Fifth Kalima (Astaghfar)",
      "أَسْتَغْفِرُ اللّٰهَ رَبِّيْ مِنْ كُلِّ ذَنْبٍ أَذْنَبْتُهُ عَمْدًا أَوْ خَطَأً سِرًّا أَوْ عَلَانِيَةً وَأَتُوْبُ إِلَيْهِ مِنَ الذَّنْبِ الَّذِيْ أَعْلَمُ وَمِنَ الذَّنْبِ الَّذِيْ لَا أَعْلَمُ، إِنَّكَ أَنْتَ عَلَّامُ الْغُيُوْبِ وَسَتَّارُ الْعُيُوْبِ وَغَفَّارُ الذُّنُوْبِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ الْعَلِيِّ الْعَظِيْمِ",
      "I seek forgiveness from Allah, my Lord, from every sin I committed knowingly or unknowingly, secretly or openly, and I turn to Him in repentance from the sin I know and from the sin I do not know. Surely You are the Knower of the hidden and the Concealer of faults, and the Forgiver of sins. There is no power and no strength except with Allah, the Most High, the Most Great.",
    ),
    Kalma(
      "Sixth Kalima (Radd-e-Kufr)",
      "اللّٰهُمَّ إِنِّي أَعُوْذُ بِكَ مِنْ أَنْ أُشْرِكَ بِكَ شَيْئًا وَأَنَا أَعْلَمُ بِهِ، وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُ بِهِ، تُبْتُ عَنْهُ وَتَبَرَّأْتُ مِنَ الْكُفْرِ وَالشِّرْكِ وَالْكِذْبِ وَالْغِيْبَةِ وَالْبِدْعَةِ وَالنَّمِيْمَةِ وَالْفَوَاحِشِ وَالْبُهْتَانِ وَالْمَعَاصِي كُلِّهَا، وَأَسْلَمْتُ وَأَقُوْلُ لَا إِلٰهَ إِلَّا اللّٰهُ مُحَمَّدٌ رَسُوْلُ اللّٰهِ",
      "O Allah! I seek refuge in You from associating anything with You knowingly, and I seek Your forgiveness for what I do not know. I repent from it and declare myself free from disbelief, polytheism, falsehood, backbiting, innovation, slander, indecency, calumny, and all sins. I submit to Your will and declare: There is no god but Allah, Muhammad is the Messenger of Allah.",
    ),
  ];

  Kalma get currentKalma => _kalmaList[_currentIndex];
  nextKalma() {
    _currentIndex = (_currentIndex + 1) % _kalmaList.length;
    counter = 0;
    notifyListeners();
  }

  backkalma() {
    _currentIndex = (_currentIndex - 1) % _kalmaList.length;
    counter = 0;
    notifyListeners();
  }
}

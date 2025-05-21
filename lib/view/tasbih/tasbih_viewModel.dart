import 'package:stacked/stacked.dart';

class Zikr {
  final String arabic;
  final String meaning;

  Zikr(this.arabic, this.meaning);
}

class TasbihViewmodel extends BaseViewModel {
  int _counter = 0;
  int _currentIndex = 0;

  int get counter => _counter;

  final List<Zikr> _zikrList = [
    Zikr("ٱللّٰهُ أَكْبَرُ", "Allah is the Greatest"),
    Zikr("سُبْحَانَ ٱللّٰهِ", "Glory be to Allah"),
    Zikr("ٱلْـحَمْدُ لِلّٰهِ", "Praise be to Allah"),
    Zikr("لَا إِلٰهَ إِلَّا ٱللّٰهُ", "There is no god but Allah"),
    Zikr("أَسْتَغْفِرُ ٱللّٰهَ", "I seek forgiveness from Allah"),
    Zikr("سُبْحَانَ ٱللّٰهِ وَبِحَمْدِهِ", "Glory be to Allah and His Praise"),
    Zikr("سُبْحَانَ ٱللّٰهِ ٱلْعَظِيمِ", "Glory be to Allah the Almighty"),
    Zikr(
      "لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِٱللّٰهِ",
      "There is no power nor strength except with Allah",
    ),
    Zikr(
      "ٱللّٰهُ أَكْبَرُ كَبِيرًا، وَٱلْـحَمْدُ لِلّٰهِ كَثِيرًا، وَسُبْحَانَ ٱللّٰهِ بُكْرَةً وَأَصِيلًا",
      "Allah is the Greatest, much praise be to Allah, and glory be to Allah in the morning and evening",
    ),
    Zikr(
      "رَضِيتُ بِٱللّٰهِ رَبًّا، وَبِٱلْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ ﷺ نَبِيًّا",
      "I am pleased with Allah as my Lord, Islam as my religion, and Muhammad (peace be upon him) as my Prophet",
    ),
    Zikr(
      "ٱللّٰهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ",
      "O Allah, send blessings upon Muhammad and the family of Muhammad",
    ),
    Zikr(
      "ٱللّٰهُمَّ أَنْتَ رَبِّي لَا إِلٰهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ وَوَعْدِكَ مَا ٱسْتَطَعْتُ",
      "O Allah, You are my Lord, there is no god but You...",
    ),
    Zikr(
      "سُبْحَانَكَ ٱللّٰهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ",
      "Glory be to You O Allah, and praise be to You...",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ ٱلْهَمِّ وَٱلْحَزَنِ",
      "O Allah, I seek refuge in You from grief and sorrow",
    ),
    Zikr(
      "حَسْبِيَ ٱللّٰهُ وَنِعْمَ ٱلْوَكِيلُ",
      "Allah is sufficient for me and He is the best disposer of affairs",
    ),
    Zikr(
      "لَا إِلٰهَ إِلَّا أَنْتَ، سُبْحَانَكَ، إِنِّي كُنْتُ مِنَ ٱلظَّالِمِينَ",
      "There is no god but You, glory be to You, I was among the wrongdoers",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا",
      "O Allah, I ask You for beneficial knowledge...",
    ),
    Zikr(
      "ٱللّٰهُمَّ ٱغْفِرْ لِي، وَٱرْحَمْنِي، وَٱهْدِنِي، وَعَافِنِي، وَٱرْزُقْنِي",
      "O Allah, forgive me, have mercy on me...",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ ٱلْكُفْرِ وَٱلْفَقْرِ",
      "O Allah, I seek refuge in You from disbelief and poverty",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ ٱلْقَبْرِ",
      "O Allah, I seek refuge in You from the punishment of the grave",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ فِتْنَةِ ٱلْمَحْيَا وَٱلْمَمَاتِ",
      "O Allah, I seek refuge in You from the trials of life and death",
    ),
    Zikr(
      "ٱللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ ٱلْمَأْثَمِ وَٱلْمَغْرَمِ",
      "O Allah, I seek refuge in You from sin and debt",
    ),
    Zikr(
      "ٱللّٰهُمَّ آتِنَا فِي ٱلدُّنْيَا حَسَنَةً، وَفِي ٱلْآخِرَةِ حَسَنَةً، وَقِنَا عَذَابَ ٱلنَّارِ",
      "O Allah, grant us good in this world and in the Hereafter...",
    ),
    Zikr(
      "رَبَّنَا آتِنَا مِن لَّدُنكَ رَحْمَةً، وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا",
      "Our Lord, grant us mercy from Yourself...",
    ),
    Zikr(
      "رَبِّ ٱغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ ٱلْحِسَابُ",
      "My Lord, forgive me and my parents and the believers...",
    ),
  ];

  Zikr get currentZikr => _zikrList[_currentIndex];

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void nextZikr() {
    _currentIndex = (_currentIndex + 1) % _zikrList.length;
    _counter = 0;
    notifyListeners();
  }
}

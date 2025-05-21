import 'package:stacked/stacked.dart';

class Dua {
  final String name;
  final String dua;
  final String meaning;

  Dua(this.name, this.dua, this.meaning);
}

class DuaViewmodel extends BaseViewModel {
  int counter = 0;
  int _counterIndex = 0;

  Dua get currentDua => _duaList[_counterIndex];

  final List<Dua> _duaList = [
    Dua(
      "Waking up",
      "الْـحَمْـدُ للهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "All praise is for Allah who gave us life after having taken it from us and unto Him is the resurrection.",
    ),

    Dua(
      "Before sleeping",
      "اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا",
      "O Allah, in Your name I die and I live.",
    ),

    Dua(
      "Entering toilet",
      "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
      "O Allah, I seek refuge with You from all evil and evil-doers.",
    ),

    Dua("Leaving toilet", "غُفْرَانَكَ", "I ask You for forgiveness."),

    Dua("Before eating", "بِسْمِ اللهِ", "In the name of Allah."),

    Dua(
      "After eating",
      "الْـحَمْـدُ للهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِينَ",
      "All praise is for Allah who fed us, gave us drink, and made us Muslims.",
    ),

    Dua(
      "Entering home",
      "اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلَجِ وَخَيْرَ الْمَخْرَجِ",
      "O Allah, I ask You for a good entrance and a good exit.",
    ),

    Dua(
      "Leaving home",
      "بِسْمِ اللهِ تَوَكَّلْتُ عَلَى اللهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ",
      "In the name of Allah, I place my trust in Allah, and there is no might nor power except with Allah.",
    ),

    Dua(
      "Entering masjid",
      "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
      "O Allah, open the gates of Your mercy for me.",
    ),

    Dua(
      "Leaving masjid",
      "اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ",
      "O Allah, I ask You from Your bounty.",
    ),

    Dua(
      "After Adhan",
      "اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، وَالصَّلَاةِ الْقَائِمَةِ، آتِ مُحَمَّدًا الْوَسِيلَةَ وَالْفَضِيلَةَ، وَابْعَثْهُ مَقَامًا مَحْمُودًا الَّذِي وَعَدْتَهُ، إِنَّكَ لَا تُخْلِفُ الْمِيعَادَ",
      "O Allah, Lord of this perfect call and the established prayer, grant Muhammad the intercession and favor, and raise him to the honored station You have promised him, verily You do not neglect promises.",
    ),

    Dua(
      "Wearing Clothes",
      "الْـحَمْـدُ للهِ الَّذِي كَسَانِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
      "All praise is for Allah who has clothed me with this garment and provided it for me, with no power nor might from myself.",
    ),

    Dua(
      "New Clothes",
      "اللَّهُمَّ لَكَ الْـحَمْدُ أَنْتَ كَسَوْتَنِيهِ، أَسْأَلُكَ خَيْرَهُ وَخَيْرَ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ",
      "O Allah, all praise is to You. You have clothed me with it. I ask You for its goodness and the goodness for which it was made, and I seek refuge in You from its evil and the evil for which it was made.",
    ),

    Dua(
      "Looking in mirror",
      "اللَّهُمَّ كَمَا أَحْسَنْتَ خَلْقِي فَأَحْسِنْ خُلُقِي",
      "O Allah, just as You made my external beautiful, make my character beautiful.",
    ),

    Dua("Upon sneezing", "الْـحَمْـدُ للهِ", "All praise is for Allah."),

    Dua(
      "For the one who sneezes",
      "يَرْحَمُكَ اللَّهُ",
      "May Allah have mercy on you.",
    ),

    Dua(
      "When angry",
      "أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ",
      "I seek refuge in Allah from the accursed devil.",
    ),

    Dua(
      "In difficulty",
      "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ",
      "Allah is sufficient for us and He is the best disposer of affairs.",
    ),

    Dua(
      "Seeing something good",
      "مَا شَاءَ اللهُ لَا قُوَّةَ إِلَّا بِاللهِ",
      "What Allah willed [has happened]; there is no power except with Allah.",
    ),

    Dua(
      "Boarding a Vehicle",
      "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ، وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
      "Glory is to Him who has subjected this (transport) to us, and we could never have accomplished it (by ourselves). And indeed, to our Lord we will surely return.",
    ),

    Dua(
      "Rain",
      "اللَّهُمَّ صَيِّبًا نَافِعًا",
      "O Allah, (bring) beneficial rain.",
    ),

    Dua(
      "Visiting sick",
      "لَا بَأْسَ طَهُورٌ إِنْ شَاءَ اللَّهُ",
      "No worry, it is a purification, if Allah wills.",
    ),

    Dua(
      "Entering Graveyard",
      "السَّلَامُ عَلَيْكُمْ أَهْلَ الدِّيَارِ، مِنَ الْمُؤْمِنِينَ وَالْمُسْلِمِينَ، وَإِنَّا إِنْ شَاءَ اللَّهُ بِكُمْ لَاحِقُونَ، نَسْأَلُ اللَّهَ لَنَا وَلَكُمُ الْعَافِيَةَ",
      "Peace be upon you, O inhabitants of the graves, believers and Muslims. Indeed, we are, Allah willing, to join you. We ask Allah for well-being for us and for you.",
    ),

    Dua(
      "After Wudu",
      "أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ، اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ، وَاجْعَلْنِي مِنَ الْمُتَطَهِّرِينَ",
      "I bear witness that there is no deity but Allah alone, with no partner, and I bear witness that Muhammad is His servant and Messenger. O Allah, make me among those who turn in repentance and make me among those who purify themselves.",
    ),

    Dua(
      "After Prayer",
      "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالإِكْرَامِ",
      "O Allah, You are Peace and from You is peace. Blessed are You, O Possessor of Glory and Honor.",
    ),
  ];

  backDua() {
    _counterIndex = (_counterIndex - 1) % _duaList.length;
    notifyListeners();
  }

  nextDua() {
    _counterIndex = (_counterIndex + 1) % _duaList.length;
    notifyListeners();
  }
}

import 'package:stacked/stacked.dart';

class Hadees {
  final String title;
  final String arabic;
  final String meaning;
  Hadees(this.title, this.arabic, this.meaning);
}

class HadeesViewmodel extends BaseViewModel {
  int _currentIndex = 0;

  final List<Hadees> _hadeesList = [
    Hadees(
      "Best Deed",
      "أَفْضَلُ ٱلْأَعْمَالِ ٱلصَّلَاةُ فِي وَقْتِهَا",
      "The best deed is prayer at its proper time.",
    ),
    Hadees(
      "Smile is Charity",
      "تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ",
      "Smiling at your brother is charity.",
    ),
    Hadees("Avoid Anger", "لَا تَغْضَبْ", "Do not get angry."),
    Hadees(
      "Cleanliness",
      "ٱلطُّهُورُ شَطْرُ ٱلْإِيمَانِ",
      "Cleanliness is half of faith.",
    ),
    Hadees(
      "Speak Good",
      "مَنْ كَانَ يُؤْمِنُ بِٱللَّهِ وَٱلْيَوْمِ ٱلْآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ",
      "Whoever believes in Allah and the Last Day, let him speak good or remain silent.",
    ),
    Hadees(
      "Easy Religion",
      "إِنَّ ٱلدِّينَ يُسْرٌ",
      "Indeed, religion is easy.",
    ),
    Hadees(
      "Intentions",
      "إِنَّمَا ٱلْأَعْمَالُ بِٱلنِّيَّاتِ",
      "Actions are judged by intentions.",
    ),
    Hadees(
      "Love for Others",
      "لَا يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لِأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ",
      "None of you truly believes until he loves for his brother what he loves for himself.",
    ),
    Hadees(
      "Modesty",
      "ٱلْحَيَاءُ شُعْبَةٌ مِّنَ ٱلْإِيمَانِ",
      "Modesty is a part of faith.",
    ),
    Hadees(
      "Kindness to Parents",
      "رِضَا ٱللَّهِ فِي رِضَا ٱلْوَالِدِ",
      "Allah’s pleasure is in pleasing the parent.",
    ),
    Hadees(
      "Help Others",
      "ٱللَّهُ فِي عَوْنِ ٱلْعَبْدِ مَا كَانَ ٱلْعَبْدُ فِي عَوْنِ أَخِيهِ",
      "Allah helps the servant as long as he helps his brother.",
    ),
    Hadees(
      "Forgive Others",
      "ٱرْحَمُوا تُرْحَمُوا",
      "Have mercy, and you will receive mercy.",
    ),
    Hadees(
      "Say Salam",
      "أَفْشُوا ٱلسَّلَامَ بَيْنَكُمْ",
      "Spread peace among yourselves.",
    ),
    Hadees(
      "Trust Allah",
      "مَنْ تَوَكَّلَ عَلَى ٱللَّهِ فَهُوَ حَسْبُهُ",
      "Whoever relies upon Allah, He is sufficient for him.",
    ),
    Hadees(
      "Be Honest",
      "ٱلصِّدْقُ يُنْجِي",
      "Truthfulness leads to salvation.",
    ),
    Hadees("Don't Envy", "لَا تَحَاسَدُوا", "Do not envy one another."),
    Hadees(
      "Respect Elders",
      "لَيْسَ مِنَّا مَنْ لَمْ يُوَقِّرْ كَبِيرَنَا",
      "He is not one of us who does not respect our elders.",
    ),
    Hadees(
      "Control Tongue",
      "مَنْ يَضْمَنْ لِي مَا بَيْنَ لَحْيَيْهِ أَضْمَنْ لَهُ ٱلْجَنَّةَ",
      "Whoever guarantees what is between his jaws, I guarantee him Paradise.",
    ),
    Hadees(
      "Say Alhamdulillah",
      "ٱلْحَمْدُ لِلَّهِ تَمْلَأُ ٱلْمِيزَانَ",
      "Alhamdulillah fills the scale.",
    ),
    Hadees(
      "Greet First",
      "يَبْدَأُ بِٱلسَّلَامِ ٱلْأَقْرَبُ إِلَى ٱللَّهِ",
      "The one closer to Allah is the one who greets first.",
    ),
    Hadees("Visit the Sick", "عُودُوا ٱلْمَرِيضَ", "Visit the sick."),
    Hadees("Fast for Taqwa", "ٱلصِّيَامُ جُنَّةٌ", "Fasting is a shield."),
    Hadees(
      "Du’a is Worship",
      "ٱلدُّعَاءُ هُوَ ٱلْعِبَادَةُ",
      "Supplication is worship.",
    ),
    Hadees(
      "No Harm",
      "لَا ضَرَرَ وَلَا ضِرَارَ",
      "Do not harm and do not reciprocate harm.",
    ),
    Hadees(
      "Best Manners",
      "إِنَّ مِنْ خِيَارِكُمْ أَحْسَنُكُمْ أَخْلَاقًا",
      "The best among you are those with the best manners.",
    ),
  ];

  Hadees get currentHadess => _hadeesList[_currentIndex];
  nextHadees() {
    _currentIndex = (_currentIndex + 1) % _hadeesList.length;
    notifyListeners();
  }

  backHadees() {
    _currentIndex = (_currentIndex - 1) % _hadeesList.length;
    notifyListeners();
  }
}

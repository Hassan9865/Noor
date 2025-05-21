import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:noor/model/ayat_model.dart';
import 'package:noor/model/quran_data.dart';
import 'package:noor/model/surah_model.dart';

class QuranService {
  Future<QuranData> loadQuranData() async {
    // Load ayahs JSON
    final ayahsJson = await rootBundle.loadString('assets/quran/quran.json');
    final ayahsMap = json.decode(ayahsJson) as Map<String, dynamic>;

    final ayahs = <int, List<Ayah>>{};
    ayahsMap.forEach((key, value) {
      final chapter = int.parse(key);
      ayahs[chapter] = (value as List).map((e) => Ayah.fromJson(e)).toList();
    });

    // Load surahs JSON
    final surahsJson = await rootBundle.loadString('assets/quran/ur.json');
    final surahsList = json.decode(surahsJson) as List<dynamic>;

    final surahs = surahsList.map((e) => Surah.fromJson(e)).toList();

    return QuranData(ayahs: ayahs, surahs: surahs);
  }
}

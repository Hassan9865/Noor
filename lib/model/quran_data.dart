import 'package:noor/model/ayat_model.dart';
import 'package:noor/model/surah_model.dart';

class QuranData {
  final Map<int, List<Ayah>> ayahs;
  final List<Surah> surahs;

  QuranData({required this.ayahs, required this.surahs});
}

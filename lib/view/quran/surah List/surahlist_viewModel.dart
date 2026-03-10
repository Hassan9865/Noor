import 'package:quran_library/quran_library.dart';
import 'package:stacked/stacked.dart';

class SurahlistViewmodel extends BaseViewModel {
  List<String>? data;

  SurahlistViewmodel() {
    loadSurahs();
  }

  Future<void> loadSurahs() async {
    setBusy(true);

    data = QuranLibrary.getAllSurahs();

    setBusy(false);
  }
}

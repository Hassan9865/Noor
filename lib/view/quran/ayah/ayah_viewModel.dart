import 'package:noor/model/ayat_model.dart';
import 'package:noor/services/quran_services.dart';
import 'package:stacked/stacked.dart';

class AyahViewModel extends BaseViewModel {
  final QuranService _quranService;
  final int surahId;

  List<Ayah>? ayahs;
  int currentAyahIndex = 0;

  AyahViewModel(this._quranService, this.surahId);

  Future<void> loadAyahs() async {
    setBusy(true);
    final quranData = await _quranService.loadQuranData();
    ayahs = quranData.ayahs[surahId];
    setBusy(false);
  }

  void nextAyah() {
    if (ayahs != null && currentAyahIndex < ayahs!.length - 1) {
      currentAyahIndex++;
      notifyListeners();
    }
  }

  void previousAyah() {
    if (currentAyahIndex > 0) {
      currentAyahIndex--;
      notifyListeners();
    }
  }

  Ayah? get currentAyah => ayahs != null ? ayahs![currentAyahIndex] : null;
  bool get hasNext => ayahs != null && currentAyahIndex < ayahs!.length - 1;
  bool get hasPrevious => currentAyahIndex > 0;
}

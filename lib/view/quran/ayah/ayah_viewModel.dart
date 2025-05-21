import 'package:noor/model/ayat_model.dart';
import 'package:noor/model/surah_model.dart';
import 'package:noor/services/quran_services.dart';
import 'package:stacked/stacked.dart';

class AyahViewModel extends BaseViewModel {
  final QuranService _quranService;
  final int surahId;

  List<Ayah>? ayahs;
  int currentPage = 0;
  final int versesPerPage = 10;
  String? surahName;

  AyahViewModel(this._quranService, this.surahId);

  Future<void> loadAyahs() async {
    setBusy(true);
    try {
      final quranData = await _quranService.loadQuranData();
      ayahs = quranData.ayahs[surahId];
      surahName =
          quranData.surahs
              .firstWhere(
                (s) => s.id == surahId,
                orElse:
                    () => Surah(
                      id: 0,
                      name: '',
                      transliteration: '',
                      translation: '',
                      type: '',
                      totalVerses: 0,
                    ),
              )
              .transliteration;
      notifyListeners();
    } catch (e) {
      setError(e);
    } finally {
      setBusy(false);
    }
  }

  List<Ayah>? get currentPageAyahs {
    if (ayahs == null) return null;
    final start = currentPage * versesPerPage;
    final end = (start + versesPerPage).clamp(0, ayahs!.length);
    return ayahs!.sublist(start, end);
  }

  int get totalPages =>
      ayahs == null ? 0 : (ayahs!.length / versesPerPage).ceil();

  void nextPage() {
    if (hasNextPage) {
      currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (hasPreviousPage) {
      currentPage--;
      notifyListeners();
    }
  }

  void jumpToPage(int page) {
    if (page >= 0 && page < totalPages) {
      currentPage = page;
      notifyListeners();
    }
  }

  void jumpToVerse(int verseNumber) {
    if (ayahs == null) return;

    final verseIndex = ayahs!.indexWhere((a) => a.verse == verseNumber);
    if (verseIndex != -1) {
      currentPage = verseIndex ~/ versesPerPage;
      notifyListeners();

      // Optional: Scroll to the specific verse
      // You'll need to implement this with a ScrollController
    }
  }

  bool get hasNextPage =>
      ayahs != null && (currentPage + 1) * versesPerPage < ayahs!.length;

  bool get hasPreviousPage => currentPage > 0;
}

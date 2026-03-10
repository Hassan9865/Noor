import 'package:stacked/stacked.dart';

class QuranOptionViewmodel extends BaseViewModel {
  // final _quranService = locator<QuranService>();
  // final _navigationService = locator<NavigationService>();

  // late int _surahId;
  List<Map<String, dynamic>> _allSurahs = [];
  List<Map<String, dynamic>> _filteredSurahs = [];

  // Properties
  int _currentPage = 1;
  bool _isDark = false;
  double _fontSize = 20;
  String _translationLanguage = 'en';
  String _currentReciter = 'Mishary Al-Afasy';

  // Getters
  List<Map<String, dynamic>> get filteredSurahs => _filteredSurahs;
  int get currentPage => _currentPage;
  bool get isDark => _isDark;
  double get fontSize => _fontSize;
  String get translationLanguage => _translationLanguage;
  String get currentReciter => _currentReciter;

  // void init({required int surahId}) {
  //   _surahId = surahId;
  //   setBusy(true);
  //   _loadSurahs();
  //   setBusy(false);
  // }

  // void _loadSurahs() {
  //   _allSurahs = _quranService.getAllSurahs();
  //   _filteredSurahs = _allSurahs;
  // }

  void searchSurahs(String query) {
    if (query.isEmpty) {
      _filteredSurahs = _allSurahs;
    } else {
      _filteredSurahs =
          _allSurahs
              .where(
                (surah) =>
                    surah['name'].toLowerCase().contains(query.toLowerCase()) ||
                    surah['nameArabic'].contains(query) ||
                    surah['nameEnglish'].toLowerCase().contains(
                      query.toLowerCase(),
                    ),
              )
              .toList();
    }
    notifyListeners();
  }

  void navigateToSurah(int surahId) {
    // _navigationService.navigateTo(
    //   Routes.quranView,
    //   arguments: QuranViewArguments(
    //     surahId: surahId,
    //     isDark: _isDark,
    //     appLanguageCode: _translationLanguage,
    //     isLoadedFont: true,
    //   ),
    // );
  }

  void navigateToJuz(int juzNumber) {
    // Navigate to specific Juz
  }

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void goToPage() {
    // Navigate to specific page
  }

  String getSurahNameByPage() {
    // Get surah name for current page
    return 'Al-Baqarah';
  }

  String getJuzByPage() {
    // Get juz number for current page
    return 'Juz\' 1';
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  void setTranslationLanguage(String language) {
    _translationLanguage = language;
    notifyListeners();
  }

  void openAudioSettings() {
    // Open audio settings dialog
  }

  void resetSettings() {
    _isDark = false;
    _fontSize = 20;
    _translationLanguage = 'en';
    _currentReciter = 'Mishary Al-Afasy';
    notifyListeners();
  }
}

import 'package:noor/app/app.locator.dart';
import 'package:noor/app/app.router.dart';
import 'package:noor/model/surah_model.dart';
import 'package:noor/services/quran_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurahListViewModel extends FutureViewModel<List<Surah>> {
  final NavigationService _navigationService = locator<NavigationService>();

  final QuranService _quranService = QuranService();

  @override
  Future<List<Surah>> futureToRun() async {
    final quranData = await _quranService.loadQuranData();
    return quranData.surahs;
  }

  void navigateToAyahView(int surahId) {
    _navigationService.navigateTo(
      Routes.ayahView,
      arguments: AyahViewArguments(surahId: surahId),
    );
  }
}

import 'package:noor/services/prayer_time_service.dart';
import 'package:noor/services/quran_services.dart';
import 'package:noor/view/dua/dua_view.dart';
import 'package:noor/view/hadees/hadees_view.dart';
import 'package:noor/view/home/home_view.dart';
import 'package:noor/view/kalma/kalma_view.dart';
import 'package:noor/view/prayer%20time/prayer_time_view.dart';
import 'package:noor/view/qibla/qibla_view.dart';
import 'package:noor/view/quran/ayah/ayah_view.dart';
import 'package:noor/view/quran/surah/surah_view.dart';
import 'package:noor/view/tasbih/tasbih_view.dart';
import 'package:noor/view/zakat/zakat_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: QiblaView),
    MaterialRoute(page: PrayerTimeView),
    MaterialRoute(page: TasbihView),
    MaterialRoute(page: DuaView),
    MaterialRoute(page: SurahListView),
    MaterialRoute(page: AyahView),
    MaterialRoute(page: ZakatView),
    MaterialRoute(page: KalmaView),
    MaterialRoute(page: HadeesView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    LazySingleton(classType: QuranService),
    LazySingleton(classType: PrayerTimeService),
  ],
)
class App {}

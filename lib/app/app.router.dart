// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:noor/view/dua/dua_view.dart' as _i6;
import 'package:noor/view/hadees/hadees_view.dart' as _i11;
import 'package:noor/view/home/home_view.dart' as _i2;
import 'package:noor/view/kalma/kalma_view.dart' as _i10;
import 'package:noor/view/prayer%20time/prayer_time_view.dart' as _i4;
import 'package:noor/view/qibla/qibla_view.dart' as _i3;
import 'package:noor/view/quran/quran%20option/quran_option_view.dart' as _i8;
import 'package:noor/view/quran/surah/surah_view.dart' as _i7;
import 'package:noor/view/tasbih/tasbih_view.dart' as _i5;
import 'package:noor/view/zakat/zakat_view.dart' as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const homeView = '/';

  static const qiblaView = '/qibla-view';

  static const prayerTimeView = '/prayer-time-view';

  static const tasbihView = '/tasbih-view';

  static const duaView = '/dua-view';

  static const surahListView = '/surah-list-view';

  static const quranOptionView = '/quran-option-view';

  static const zakatView = '/zakat-view';

  static const kalmaView = '/kalma-view';

  static const hadeesView = '/hadees-view';

  static const all = <String>{
    homeView,
    qiblaView,
    prayerTimeView,
    tasbihView,
    duaView,
    surahListView,
    quranOptionView,
    zakatView,
    kalmaView,
    hadeesView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.homeView, page: _i2.HomeView),
    _i1.RouteDef(Routes.qiblaView, page: _i3.QiblaView),
    _i1.RouteDef(Routes.prayerTimeView, page: _i4.PrayerTimeView),
    _i1.RouteDef(Routes.tasbihView, page: _i5.TasbihView),
    _i1.RouteDef(Routes.duaView, page: _i6.DuaView),
    _i1.RouteDef(Routes.surahListView, page: _i7.SurahListView),
    _i1.RouteDef(Routes.quranOptionView, page: _i8.QuranOptionView),
    _i1.RouteDef(Routes.zakatView, page: _i9.ZakatView),
    _i1.RouteDef(Routes.kalmaView, page: _i10.KalmaView),
    _i1.RouteDef(Routes.hadeesView, page: _i11.HadeesView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.QiblaView: (data) {
      final args = data.getArgs<QiblaViewArguments>(
        orElse: () => const QiblaViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.QiblaView(key: args.key),
        settings: data,
      );
    },
    _i4.PrayerTimeView: (data) {
      final args = data.getArgs<PrayerTimeViewArguments>(
        orElse: () => const PrayerTimeViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.PrayerTimeView(key: args.key),
        settings: data,
      );
    },
    _i5.TasbihView: (data) {
      final args = data.getArgs<TasbihViewArguments>(
        orElse: () => const TasbihViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.TasbihView(key: args.key),
        settings: data,
      );
    },
    _i6.DuaView: (data) {
      final args = data.getArgs<DuaViewArguments>(
        orElse: () => const DuaViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.DuaView(key: args.key),
        settings: data,
      );
    },
    _i7.SurahListView: (data) {
      final args = data.getArgs<SurahListViewArguments>(
        orElse: () => const SurahListViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.SurahListView(key: args.key),
        settings: data,
      );
    },
    _i8.QuranOptionView: (data) {
      final args = data.getArgs<QuranOptionViewArguments>(
        orElse: () => const QuranOptionViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.QuranOptionView(key: args.key),
        settings: data,
      );
    },
    _i9.ZakatView: (data) {
      final args = data.getArgs<ZakatViewArguments>(
        orElse: () => const ZakatViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ZakatView(key: args.key),
        settings: data,
      );
    },
    _i10.KalmaView: (data) {
      final args = data.getArgs<KalmaViewArguments>(
        orElse: () => const KalmaViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.KalmaView(key: args.key),
        settings: data,
      );
    },
    _i11.HadeesView: (data) {
      final args = data.getArgs<HadeesViewArguments>(
        orElse: () => const HadeesViewArguments(),
      );
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.HadeesView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class QiblaViewArguments {
  const QiblaViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant QiblaViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PrayerTimeViewArguments {
  const PrayerTimeViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PrayerTimeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class TasbihViewArguments {
  const TasbihViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant TasbihViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class DuaViewArguments {
  const DuaViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant DuaViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SurahListViewArguments {
  const SurahListViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SurahListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class QuranOptionViewArguments {
  const QuranOptionViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant QuranOptionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ZakatViewArguments {
  const ZakatViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ZakatViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class KalmaViewArguments {
  const KalmaViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant KalmaViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HadeesViewArguments {
  const HadeesViewArguments({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HadeesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToQiblaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.qiblaView,
      arguments: QiblaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPrayerTimeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.prayerTimeView,
      arguments: PrayerTimeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTasbihView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.tasbihView,
      arguments: TasbihViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDuaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.duaView,
      arguments: DuaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSurahListView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.surahListView,
      arguments: SurahListViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToQuranOptionView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.quranOptionView,
      arguments: QuranOptionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToZakatView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.zakatView,
      arguments: ZakatViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToKalmaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.kalmaView,
      arguments: KalmaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHadeesView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.hadeesView,
      arguments: HadeesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithQiblaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.qiblaView,
      arguments: QiblaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPrayerTimeView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.prayerTimeView,
      arguments: PrayerTimeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithTasbihView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.tasbihView,
      arguments: TasbihViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDuaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.duaView,
      arguments: DuaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSurahListView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.surahListView,
      arguments: SurahListViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithQuranOptionView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.quranOptionView,
      arguments: QuranOptionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithZakatView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.zakatView,
      arguments: ZakatViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithKalmaView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.kalmaView,
      arguments: KalmaViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHadeesView({
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.hadeesView,
      arguments: HadeesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}

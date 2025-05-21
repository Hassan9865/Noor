// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:noor/view/dua/dua_view.dart' as _i6;
import 'package:noor/view/home/home_view.dart' as _i2;
import 'package:noor/view/kalma/kalma_view.dart' as _i10;
import 'package:noor/view/prayer%20time/prayer_time_view.dart' as _i4;
import 'package:noor/view/qibla/qibla_view.dart' as _i3;
import 'package:noor/view/quran/ayah/ayah_view.dart' as _i8;
import 'package:noor/view/quran/surah/surah_view.dart' as _i7;
import 'package:noor/view/tasbih/tasbih_view.dart' as _i5;
import 'package:noor/view/zakat/zakat_view.dart' as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/';

  static const qiblaView = '/qibla-view';

  static const prayerTimeView = '/prayer-time-view';

  static const tasbihView = '/tasbih-view';

  static const duaView = '/dua-view';

  static const surahListView = '/surah-list-view';

  static const ayahView = '/ayah-view';

  static const zakatView = '/zakat-view';

  static const kalmaView = '/kalma-view';

  static const all = <String>{
    homeView,
    qiblaView,
    prayerTimeView,
    tasbihView,
    duaView,
    surahListView,
    ayahView,
    zakatView,
    kalmaView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.qiblaView,
      page: _i3.QiblaView,
    ),
    _i1.RouteDef(
      Routes.prayerTimeView,
      page: _i4.PrayerTimeView,
    ),
    _i1.RouteDef(
      Routes.tasbihView,
      page: _i5.TasbihView,
    ),
    _i1.RouteDef(
      Routes.duaView,
      page: _i6.DuaView,
    ),
    _i1.RouteDef(
      Routes.surahListView,
      page: _i7.SurahListView,
    ),
    _i1.RouteDef(
      Routes.ayahView,
      page: _i8.AyahView,
    ),
    _i1.RouteDef(
      Routes.zakatView,
      page: _i9.ZakatView,
    ),
    _i1.RouteDef(
      Routes.kalmaView,
      page: _i10.KalmaView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.QiblaView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.QiblaView(),
        settings: data,
      );
    },
    _i4.PrayerTimeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.PrayerTimeView(),
        settings: data,
      );
    },
    _i5.TasbihView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.TasbihView(),
        settings: data,
      );
    },
    _i6.DuaView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DuaView(),
        settings: data,
      );
    },
    _i7.SurahListView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SurahListView(),
        settings: data,
      );
    },
    _i8.AyahView: (data) {
      final args = data.getArgs<AyahViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.AyahView(key: args.key, surahId: args.surahId),
        settings: data,
      );
    },
    _i9.ZakatView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ZakatView(),
        settings: data,
      );
    },
    _i10.KalmaView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.KalmaView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AyahViewArguments {
  const AyahViewArguments({
    this.key,
    required this.surahId,
  });

  final _i11.Key? key;

  final int surahId;

  @override
  String toString() {
    return '{"key": "$key", "surahId": "$surahId"}';
  }

  @override
  bool operator ==(covariant AyahViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.surahId == surahId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ surahId.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToQiblaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.qiblaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrayerTimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.prayerTimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTasbihView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tasbihView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDuaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.duaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSurahListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.surahListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAyahView({
    _i11.Key? key,
    required int surahId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.ayahView,
        arguments: AyahViewArguments(key: key, surahId: surahId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToZakatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.zakatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKalmaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kalmaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithQiblaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.qiblaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrayerTimeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.prayerTimeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTasbihView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tasbihView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDuaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.duaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSurahListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.surahListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAyahView({
    _i11.Key? key,
    required int surahId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.ayahView,
        arguments: AyahViewArguments(key: key, surahId: surahId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithZakatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.zakatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKalmaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kalmaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

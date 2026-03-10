import 'package:flutter/material.dart';
import 'package:noor/view/quran/surah/surah_viewModel.dart';
import 'package:noor/view/quran/surah/widget/surah_item.dart';
import 'package:stacked/stacked.dart';
import 'package:quran_library/quran_library.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurahViewModel>.reactive(
      viewModelBuilder: () => SurahViewModel(),
      builder:
          (context, model, child) => Scaffold(
            appBar: AppBar(title: const Text('Quran Surahs')),
            body:
                model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: model.data?.length ?? 0,
                      itemBuilder:
                          (context, index) => SurahItem(
                            surah: model.data![index],
                            onTap:
                                () => model.navigateToAyahView(
                                  model.data![index].id,
                                ),
                          ),
                    ),
          ),
    );
  }
}

class QuranScreen extends StatelessWidget {
  final int? initialSurah;
  final bool isDark;

  const QuranScreen({super.key, this.initialSurah, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return QuranLibraryScreen(
      parentContext: context,

      withPageView: true,
      useDefaultAppBar: true,
      isShowTabBar: true,

      isShowAudioSlider: false,
      showAyahBookmarkedIcon: true,

      isDark: isDark,

      appLanguageCode: 'en',

      backgroundColor: Theme.of(context).colorScheme.surface,
      textColor: Colors.black,

      ayahSelectedBackgroundColor: Theme.of(
        context,
      ).colorScheme.primary.withOpacity(0.2),

      ayahIconColor: Theme.of(context).colorScheme.primary,

      /// SURAH INFO STYLE
      surahInfoStyle: SurahInfoStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(
        ayahCount: "Ayahs",
        firstTabText: "Surahs",
        secondTabText: "About Surah",
      ),

      /// BASMALA STYLE
      basmalaStyle: BasmalaStyle(
        basmalaColor: Colors.black,
        basmalaFontSize: 30,
      ),

      /// AYAH STYLE
      ayahStyle: AyahAudioStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(dialogWidth: 300),

      /// TOP BAR STYLE
      topBarStyle: QuranTopBarStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(
        showAudioButton: false,
        showFontsButton: false,
        tabIndexLabel: "Index",
        tabBookmarksLabel: "Bookmarks",
        tabSearchLabel: "Search",
      ),

      /// INDEX TAB
      indexTabStyle: IndexTabStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(tabSurahsLabel: "Surahs", tabJozzLabel: "Juz"),

      /// SEARCH TAB
      searchTabStyle: SearchTabStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(searchHintText: "Search Surah"),

      /// BOOKMARK TAB
      bookmarksTabStyle: BookmarksTabStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(emptyStateText: "No bookmarks yet"),

      /// AYAH MENU
      ayahMenuStyle: AyahMenuStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(copySuccessMessage: "Ayah Copied"),

      /// TAFSIR STYLE
      // tafsirStyle: TafsirStyle.defaults(
      //   isDark: isDark,
      //   context: context,
      // ).copyWith(
      //   widthOfBottomSheet: 500,
      //   heightOfBottomSheet: MediaQuery.of(context).size.height * 0.9,
      // ),

      /// TOP BOTTOM INFO
      topBottomQuranStyle: TopBottomQuranStyle.defaults(
        isDark: isDark,
        context: context,
      ).copyWith(hizbName: "Hizb", juzName: "Juz", sajdaName: "Sajda"),

      // initialSurah: initialSurah,
      // surahNumber: initialSurah,
    );
  }
}

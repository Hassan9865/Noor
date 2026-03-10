import 'package:flutter/material.dart';
import 'package:noor/view/quran/surah%20List/surahlist_viewModel.dart';
import 'package:noor/view/quran/surah/surah_view.dart';
import 'package:stacked/stacked.dart';

class SurahlistView extends StatelessWidget {
  const SurahlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SurahlistViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Quran Surahs")),

          body:
              viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: viewModel.data?.length ?? 0,

                    itemBuilder: (context, index) {
                      final surahName = viewModel.data![index];
                      final surahNumber = index + 1;
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(surahNumber.toString()),
                        ),

                        title: Text(surahName),

                        // subtitle: Text(
                        //   "${surah.revelationType} • ${surah.numberOfAyahs} Ayahs",
                        // ),
                        trailing: const Icon(Icons.arrow_forward_ios),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => QuranScreen(
                                    initialSurah: surahNumber,
                                    isDark: false,
                                  ),
                            ),
                          );
                        },
                      );
                    },
                  ),
        );
      },
    );
  }
}

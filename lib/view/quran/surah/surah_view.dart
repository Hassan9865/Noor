import 'package:flutter/material.dart';
import 'package:noor/view/quran/surah/surah_viewModel.dart';
import 'package:noor/view/quran/surah/widget/surah_item.dart';
import 'package:stacked/stacked.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurahListViewModel>.reactive(
      viewModelBuilder: () => SurahListViewModel(),
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

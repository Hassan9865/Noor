import 'package:flutter/material.dart';
import 'package:noor/app/app.locator.dart';
import 'package:noor/services/quran_services.dart';
import 'package:noor/view/quran/ayah/ayah_viewModel.dart';
import 'package:noor/view/quran/ayah/widget/ayah_item.dart';
import 'package:stacked/stacked.dart';

class AyahView extends StatelessWidget {
  final int surahId;

  const AyahView({Key? key, required this.surahId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AyahViewModel>.reactive(
      viewModelBuilder: () => AyahViewModel(locator<QuranService>(), surahId),
      onViewModelReady: (model) => model.loadAyahs(),
      builder:
          (context, model, child) => Scaffold(
            appBar: AppBar(title: const Text('Quran Ayah')),
            body:
                model.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: AyahItem(ayah: model.currentAyah!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed:
                                    model.hasPrevious
                                        ? model.previousAyah
                                        : null,
                              ),
                              Text(
                                'Ayah ${model.currentAyahIndex + 1} of ${model.ayahs?.length}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                onPressed:
                                    model.hasNext ? model.nextAyah : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),
    );
  }
}

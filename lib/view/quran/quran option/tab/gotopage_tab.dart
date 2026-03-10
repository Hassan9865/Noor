import 'package:flutter/material.dart';
import 'package:noor/view/quran/quran%20option/quran_option_viewModel.dart';
import 'package:stacked/stacked.dart';

class GotopageTab extends ViewModelWidget<QuranOptionViewmodel> {
  const GotopageTab({super.key});

  @override
  Widget build(BuildContext context, QuranOptionViewmodel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Page Number Display
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.shade50,
            border: Border.all(color: Colors.green.shade800, width: 3),
          ),
          child: Text(
            '${viewModel.currentPage}',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Page Slider
        Slider(
          value: viewModel.currentPage.toDouble(),
          min: 1,
          max: 604,
          divisions: 603,
          label: 'Page ${viewModel.currentPage}',
          onChanged: (value) => viewModel.setPage(value.toInt()),
        ),

        const SizedBox(height: 20),

        // Page Input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Page Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.pages),
                  ),
                  onSubmitted: (value) {
                    final page = int.tryParse(value);
                    if (page != null && page >= 1 && page <= 604) {
                      viewModel.setPage(page);
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => viewModel.goToPage(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Go'),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Page Info
        Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Surah: ${viewModel.getSurahNameByPage()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Juz: ${viewModel.getJuzByPage()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

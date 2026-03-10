import 'package:flutter/material.dart';
import 'package:noor/view/quran/quran%20option/quran_option_viewModel.dart';
import 'package:stacked/stacked.dart';

class JuzIndexTab extends ViewModelWidget<QuranOptionViewmodel> {
  const JuzIndexTab({super.key});

  @override
  Widget build(BuildContext context, QuranOptionViewmodel viewModel) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        final juzNumber = index + 1;
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () => viewModel.navigateToJuz(juzNumber),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade50, Colors.green.shade100],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الجزء $juzNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Juz\' $juzNumber',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noor/view/quran/quran%20option/quran_option_viewModel.dart';
import 'package:stacked/stacked.dart';

class FiveSurahTab extends ViewModelWidget<QuranOptionViewmodel> {
  const FiveSurahTab({super.key});

  @override
  Widget build(BuildContext context, QuranOptionViewmodel viewModel) {
    final fiveSurahs = [
      {
        'id': 1,
        'name': 'الفاتحة',
        'english': 'Al-Fatiha',
        'benefit': 'Opening of Quran',
      },
      {
        'id': 36,
        'name': 'يس',
        'english': 'Ya-Sin',
        'benefit': 'Heart of Quran',
      },
      {
        'id': 55,
        'name': 'الرحمن',
        'english': 'Ar-Rahman',
        'benefit': 'Beauty of Quran',
      },
      {
        'id': 56,
        'name': 'الواقعة',
        'english': 'Al-Waqiah',
        'benefit': 'Wealth & Sustenance',
      },
      {
        'id': 67,
        'name': 'الملك',
        'english': 'Al-Mulk',
        'benefit': 'Protection from Grave',
      },
    ];
    return ListView.builder(
      itemCount: fiveSurahs.length,
      itemBuilder: (context, index) {
        final surah = fiveSurahs[index];
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.green.shade50, Colors.white],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade800,
                child: Text(
                  '${surah['id']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    '${surah['name']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(${surah['english']})',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              subtitle: Text('${surah['benefit']}'),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_fill,
                  color: Colors.green.shade700,
                ),
                onPressed:
                    () =>
                        viewModel.navigateToSurah(int.parse('${surah['id']}')),
              ),
              onTap:
                  () => viewModel.navigateToSurah(int.parse('${surah['id']}')),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:noor/view/quran/quran%20option/quran_option_viewModel.dart';
import 'package:stacked/stacked.dart';

class SurahIndexTab extends ViewModelWidget<QuranOptionViewmodel> {
  const SurahIndexTab({super.key});

  @override
  Widget build(BuildContext context, QuranOptionViewmodel model) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: model.searchSurahs,
            decoration: InputDecoration(
              hintText: 'Search Surah...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
        ),

        // Surah List
        Expanded(
          child:
              model.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: model.filteredSurahs.length,
                    itemBuilder: (context, index) {
                      final surah = model.filteredSurahs[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: Text('${surah['id']}'),
                          ),
                          title: Text(
                            surah['nameArabic'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Amiri',
                            ),
                            textAlign: TextAlign.right,
                          ),
                          subtitle: Text(
                            '${surah['nameEnglish']} - ${surah['verses']} Ayat',
                          ),
                          trailing: Text(
                            surah['type'],
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => model.navigateToSurah(surah['id']),
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }
}

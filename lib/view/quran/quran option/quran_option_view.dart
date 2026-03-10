import 'package:flutter/material.dart';
import 'package:noor/core/utils/quran_border_painter.dart';
import 'package:noor/view/quran/quran%20option/quran_option_viewModel.dart';
import 'package:noor/view/quran/quran%20option/tab/five_surah_tab.dart';
import 'package:noor/view/quran/quran%20option/tab/gotopage_tab.dart';
import 'package:noor/view/quran/quran%20option/tab/juz_index_tab.dart';
import 'package:noor/view/quran/quran%20option/tab/surah_index_tab.dart';
import 'package:stacked/stacked.dart';

class QuranOptionView extends StatelessWidget {
  const QuranOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuranOptionViewmodel>.reactive(
      viewModelBuilder: () => QuranOptionViewmodel(),
      // onViewModelReady: (model) => model.init(surahId: surahId),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'القرآن الكريم',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              centerTitle: true,
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Surah Index', icon: Icon(Icons.list)),
                  Tab(text: 'Juz Index', icon: Icon(Icons.numbers)),
                  Tab(text: 'Go to Page', icon: Icon(Icons.pages)),
                  Tab(text: 'Five Surah', icon: Icon(Icons.star)),
                  Tab(text: 'Settings', icon: Icon(Icons.settings)),
                ],
              ),
            ),
            body: Container(
              // Quran Border with CustomPaint
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green.shade800, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomPaint(
                  painter: QuranBorderPainter(),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: TabBarView(
                      children: [
                        const SurahIndexTab(),

                        const JuzIndexTab(),

                        const GotopageTab(),

                        const FiveSurahTab(),

                        _buildSettingsTab(model, context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Settings Tab
  Widget _buildSettingsTab(QuranOptionViewmodel model, BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Theme Setting
        Card(
          child: ListTile(
            leading: Icon(
              model.isDark ? Icons.dark_mode : Icons.light_mode,
              color: Colors.green.shade700,
            ),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: model.isDark,
              onChanged: (value) => model.toggleTheme(),
              activeColor: Colors.green,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Font Size Setting
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.font_download, color: Colors.green.shade700),
                    const SizedBox(width: 10),
                    const Text(
                      'Font Size',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Slider(
                  value: model.fontSize,
                  min: 12,
                  max: 32,
                  divisions: 10,
                  label: '${model.fontSize.round()}px',
                  onChanged: (value) => model.setFontSize(value),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Translation Language
        Card(
          child: ListTile(
            leading: Icon(Icons.translate, color: Colors.green.shade700),
            title: Text('Translation Language'),
            subtitle: Text(model.translationLanguage),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down),
              onSelected: model.setTranslationLanguage,
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(value: 'en', child: Text('English')),
                    const PopupMenuItem(value: 'ur', child: Text('Urdu')),
                    const PopupMenuItem(value: 'ar', child: Text('Arabic')),
                  ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Audio Settings
        Card(
          child: ListTile(
            leading: Icon(Icons.volume_up, color: Colors.green.shade700),
            title: Text('Audio Settings'),
            subtitle: Text('Reciter: ${model.currentReciter}'),
            trailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: model.openAudioSettings,
            ),
            onTap: model.openAudioSettings,
          ),
        ),

        const SizedBox(height: 20),

        // Reset Button
        ElevatedButton.icon(
          onPressed: model.resetSettings,
          icon: const Icon(Icons.restore),
          label: const Text('Reset to Default'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade100,
            foregroundColor: Colors.red.shade900,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ],
    );
  }
}

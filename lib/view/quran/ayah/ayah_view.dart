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
      onModelReady: (model) => model.loadAyahs(),
      builder:
          (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('Surah ${model.surahName ?? ""}'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _showSearchDialog(context, model),
                ),
                IconButton(
                  icon: const Icon(Icons.format_list_bulleted),
                  onPressed: () => _showJumpToDialog(context, model),
                ),
              ],
            ),
            body: _buildBody(context, model),
            bottomNavigationBar: _buildBottomBar(context, model),
          ),
    );
  }

  Widget _buildBody(BuildContext context, AyahViewModel model) {
    if (model.isBusy) {
      return const Center(child: CircularProgressIndicator());
    }

    // if (model.hasError) {
    //   return Center(child: Text('Error loading verses: ${model.errorMessage}'));
    // }

    return RefreshIndicator(
      onRefresh: () => model.loadAyahs(),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 12, bottom: 80),
        itemCount: model.currentPageAyahs?.length ?? 0,
        itemBuilder:
            (context, index) => AyahItem(
              ayah: model.currentPageAyahs![index],
              isLastItem: index == (model.currentPageAyahs!.length - 1),
            ),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, AyahViewModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Page Button
          ElevatedButton.icon(
            icon: const Icon(Icons.chevron_left),
            label: const Text('Previous'),
            onPressed: model.hasPreviousPage ? model.previousPage : null,
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),

          // Page Indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Page ${model.currentPage + 1}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Next Page Button
          ElevatedButton.icon(
            icon: const Icon(Icons.chevron_right),
            label: const Text('Next'),
            onPressed: model.hasNextPage ? model.nextPage : null,
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(BuildContext context, AyahViewModel model) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Search Verse'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter verse number...',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                final verseNum = int.tryParse(value);
                if (verseNum != null) {
                  model.jumpToVerse(verseNum);
                  Navigator.pop(context);
                }
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  void _showJumpToDialog(BuildContext context, AyahViewModel model) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Jump to Page',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: model.totalPages,
                  itemBuilder:
                      (context, index) => InkWell(
                        onTap: () {
                          model.jumpToPage(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                model.currentPage == index
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                      context,
                                    ).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color:
                                    model.currentPage == index
                                        ? Theme.of(
                                          context,
                                        ).colorScheme.onPrimary
                                        : Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
    );
  }
}

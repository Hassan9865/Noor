import 'package:flutter/material.dart';
import 'package:noor/model/ayat_model.dart';

class AyahItem extends StatelessWidget {
  final Ayah ayah;
  final bool isLastItem;

  const AyahItem({Key? key, required this.ayah, this.isLastItem = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Arabic Text with beautiful styling
            Text(
              ayah.text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'UthmanicHafs',
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 12),

            // Verse number and decorative elements
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Decorative circle with verse number
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      ayah.verse.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Action buttons (bookmark, share, etc.)
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.bookmark_border, size: 20),
                      onPressed: () {},
                      tooltip: 'Bookmark',
                    ),
                    IconButton(
                      icon: Icon(Icons.share, size: 20),
                      onPressed: () {},
                      tooltip: 'Share',
                    ),
                  ],
                ),
              ],
            ),

            // Only show divider if not last item
            if (!isLastItem) ...[
              const SizedBox(height: 8),
              Divider(height: 1, color: Theme.of(context).dividerColor),
            ],
          ],
        ),
      ),
    );
  }
}

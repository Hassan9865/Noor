import 'package:flutter/material.dart';
import 'package:noor/view/prayer%20time/prayer_time_viewModel.dart';
import 'package:stacked/stacked.dart';

class TimeCard extends ViewModelWidget<PrayerTimeViewModel> {
  final String namaz;
  final String time;
  final bool isCurrentNamaz;
  final bool isNextNamaz;
  final IconData icon;
  final Color iconcolor;

  const TimeCard(
    this.namaz,
    this.time,
    this.icon,
    this.iconcolor, {
    this.isCurrentNamaz = false,
    this.isNextNamaz = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, PrayerTimeViewModel viewModel) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final timeParts = time.split(':');
    final namazTime = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );

    // Calculate time remaining
    final timeRemaining = namazTime.difference(now);
    final remainingText =
        timeRemaining.isNegative
            ? 'Passed'
            : '${timeRemaining.inHours}h ${timeRemaining.inMinutes.remainder(60)}m left';

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth >= 600;

        double titleSize = isTablet ? 30 : 18;
        double meaningSize = isTablet ? 24 : 14;

        double iconSize = isTablet ? 26 : 23;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),

          child: Card(
            elevation: isCurrentNamaz ? 8 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey, width: 2),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),

              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // Namaz Icon
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: iconcolor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, color: iconcolor, size: iconSize),
                      ),
                      SizedBox(width: isTablet ? 20 : 12),

                      // Namaz Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namaz,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: titleSize,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              remainingText,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize:
                                    remainingText == 'Passed'
                                        ? 12
                                        : meaningSize,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Time
                      Text(
                        time,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: titleSize,
                          color:
                              isCurrentNamaz
                                  ? const Color.fromARGB(255, 26, 78, 168)
                                  : Colors.black,
                          // color: const Color.fromARGB(255, 26, 78, 168),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

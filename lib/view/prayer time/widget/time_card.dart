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
    final size = MediaQuery.of(context).size;
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Card(
        elevation: isCurrentNamaz ? 8 : 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          // side: BorderSide(color: Colors.grey, width: 2),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),

          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Namaz Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconcolor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: iconcolor,
                      size: size.width * 0.06,
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Namaz Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaz,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          remainingText,
                          style: theme.textTheme.bodySmall?.copyWith(
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
                      color: const Color.fromARGB(255, 26, 78, 168),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

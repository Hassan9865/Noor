import 'package:flutter/material.dart';
import 'package:noor/view/prayer%20time/prayer_time_viewModel.dart';
import 'package:noor/view/prayer%20time/widget/time_card.dart';
import 'package:stacked/stacked.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return ViewModelBuilder<PrayerTimeViewModel>.reactive(
      viewModelBuilder: () => PrayerTimeViewModel(),
      onViewModelReady:
          (model) => model.loadPrayerTimes(24.8607, 67.0011), // Your location
      builder: (context, model, _) {
        if (model.isBusy) {
          return const Center(child: CircularProgressIndicator());
        }
        final pt = model.prayerTimings;
        return Scaffold(
          appBar: AppBar(title: const Text("Prayer Times")),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(),
                    border: Border.all(color: Colors.grey[400]!, width: 3),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "الحديث:اَفْضَلُ ٱلْأَعْمَالِ ٱلصَّلَاةُ فِي وَقْتِهَا۔",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 59, 78, 88),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      // Image.asset(
                      //   'assets/card_icon/prayer_time.png',
                      //   height: size / 7,
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        "سب سے افضل عمل وقت پر نماز پڑھنا ہے",
                        style: TextStyle(
                          fontSize: size * 0.05,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                pt == null
                    ? const Text(
                      "Failed to load prayer times. Plz check your internet connection 🛜",
                    )
                    : Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          TimeCard(
                            'Fajr',
                            '${pt.fajr}',
                            Icons.nightlight_round,
                            Colors.blue,
                          ),
                          TimeCard(
                            'Dohar',
                            '${pt.dhuhr}',
                            Icons.sunny,
                            Colors.orange,
                          ),
                          TimeCard(
                            'Asr:',
                            '${pt.asr}',
                            Icons.cloud,
                            Colors.green,
                          ),
                          TimeCard(
                            'Maghrib:',
                            '${pt.maghrib}',
                            Icons.wb_twilight,
                            Colors.purple,
                          ),
                          TimeCard(
                            'Isha:',
                            '${pt.isha}',
                            Icons.nights_stay,
                            Colors.teal,
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor/view/prayer%20time/prayer_time_viewModel.dart';
import 'package:noor/view/prayer%20time/widget/time_card.dart';
import 'package:stacked/stacked.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size.width;

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
          body: LayoutBuilder(
            builder: (context, constraints) {
              bool isTablet = constraints.maxWidth >= 600;

              double cardWidth =
                  isTablet
                      ? constraints.maxWidth * 0.6
                      : constraints.maxWidth * 0.9;

              double arabicSize = isTablet ? 36 : 22;
              double meaningSize = isTablet ? 24 : 18;

              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: cardWidth,
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
                            style: TextStyle(
                              fontSize: arabicSize,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 59, 78, 88),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          // Image.asset(
                          //   'assets/card_icon/prayer_time.png',
                          //   height: size / 7,
                          // ),
                          SizedBox(height: 10.h),
                          Text(
                            "سب سے افضل عمل وقت پر نماز پڑھنا ہے",
                            style: TextStyle(
                              fontSize: meaningSize,
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
                            padding: EdgeInsets.all(isTablet ? 12 : 8),
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
              );
            },
          ),
        );
      },
    );
  }
}

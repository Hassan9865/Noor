import 'package:flutter/material.dart';
import 'package:noor/view/prayer%20time/prayer_time_viewModel.dart';
import 'package:stacked/stacked.dart';

class PrayerTimeView extends StatelessWidget {
  const PrayerTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PrayerTimeViewmodel(),
      builder: (context, PrayerTimeViewmodel viewModel, child) {
        return Scaffold();
      },
    );
  }
}

import 'package:noor/model/prayer_timing_model.dart';
import 'package:noor/services/prayer_time_service.dart';
import 'package:stacked/stacked.dart';

class PrayerTimeViewModel extends BaseViewModel {
  final _service = PrayerTimeService();
  PrayerTimings? prayerTimings;

  Future<void> loadPrayerTimes(double lat, double long) async {
    setBusy(true);
    try {
      prayerTimings = await _service.fetchPrayerTimes(lat, long);
    } catch (e) {
      print("Error fetching prayer times: $e");
    }
    setBusy(false);
  }
}

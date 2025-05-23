import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noor/model/prayer_timing_model.dart';

class PrayerTimeService {
  Future<PrayerTimings> fetchPrayerTimes(double lat, double long) async {
    final url =
        'http://api.aladhan.com/v1/timings?latitude=$lat&longitude=$long&method=5';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PrayerTimings.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}

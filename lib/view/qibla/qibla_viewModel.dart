// import 'dart:async';
// import 'dart:math';
// import 'package:flutter_compass/flutter_compass.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// import 'package:stacked/stacked.dart';

// class QiblaViewModel extends BaseViewModel {
//   Stream<QiblaData>? _qiblaStream;
//   String _errorMessage = '';
//   bool _hasPermission = false;

//   Stream<QiblaData>? get qiblaStream => _qiblaStream;
//   String get errorMessage => _errorMessage;
//   bool get hasPermission => _hasPermission;

//   Future<void> initQibla() async {
//     // Just use a default city location — for example, Lahore:
//     const defaultLat = 31.5204;
//     const defaultLng = 74.3587;

//     final qiblaDirection = _calculateQiblaDirection(defaultLat, defaultLng);

//     _qiblaStream = FlutterCompass.events!.map((event) {
//       return QiblaData(direction: event.heading ?? 0, qibla: qiblaDirection);
//     });

//     _hasPermission = true; // Always true since no runtime permission
//     notifyListeners();
//   }

//   double _calculateQiblaDirection(double lat, double lng) {
//     const kaabaLat = 21.422487;
//     const kaabaLng = 39.826206;

//     final phiK = kaabaLat * (pi / 180);
//     final lambdaK = kaabaLng * (pi / 180);
//     final phi = lat * (pi / 180);
//     final lambda = lng * (pi / 180);

//     final term1 = sin(lambdaK - lambda);
//     final term2 = cos(phi) * tan(phiK);
//     final term3 = sin(phi) * cos(lambdaK - lambda);

//     final qibla = atan2(term1, term2 - term3) * (180 / pi);
//     return (qibla + 360) % 360;
//   }

//   Future<void> openAppSettings() async {
//     await openAppSettings();
//   }
// }

// class QiblaData {
//   final double direction;
//   final double qibla;

//   QiblaData({required this.direction, required this.qibla});
// }

import 'dart:async';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';

class QiblaViewModel extends BaseViewModel {
  final StreamController<LocationStatus> _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  LocationStatus? _locationStatus;
  bool _locationEnabled = false;
  String? _errorMessage;

  Stream<LocationStatus> get locationStream => _locationStreamController.stream;
  LocationStatus? get locationStatus => _locationStatus;
  bool get locationEnabled => _locationEnabled;
  String? get errorMessage => _errorMessage;

  Future<void> initialize() async {
    await checkLocationStatus();
  }

  Future<void> checkLocationStatus() async {
    setBusy(true);
    try {
      final status = await FlutterQiblah.checkLocationStatus();
      _locationEnabled = status.enabled;
      _locationStatus = status;

      if (status.enabled && _isPermissionDenied(status.status)) {
        await FlutterQiblah.requestPermissions();
        final newStatus = await FlutterQiblah.checkLocationStatus();
        _locationStreamController.add(newStatus);
        _locationStatus = newStatus;
        _locationEnabled = newStatus.enabled;
      } else {
        _locationStreamController.add(status);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  bool _isPermissionDenied(dynamic status) {
    return status == LocationPermission.denied ||
        status == LocationPermission.deniedForever;
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }
}

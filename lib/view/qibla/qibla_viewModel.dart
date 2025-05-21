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

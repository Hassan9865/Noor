import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/qiblah/4.svg');

  CompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: _checkCompassSupport(),
      builder: (context, supportSnapshot) {
        // Handle loading state
        if (supportSnapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerLoader();
        }

        // Handle errors or null data
        if (supportSnapshot.hasError || supportSnapshot.data == null) {
          return _buildUnsupportedDevice(context);
        }

        // Check if device supports compass
        if (supportSnapshot.data == false) {
          return _buildUnsupportedDevice(context);
        }

        return Container(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QiblahDirection>(
            stream: FlutterQiblah.qiblahStream,
            builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
              // Show calibration warning if needed
              if (snapshot.hasError) {
                return _buildCalibrationWarning(context, snapshot.error);
              }

              // Show shimmer while loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildShimmerLoader();
              }

              // Show error if no data
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Unable to load Qibla direction"),
                );
              }

              // Show compass when everything is ready
              final qiblahDirection = snapshot.data!;
              final angle = ((qiblahDirection.qiblah) * (pi / 180) * -1);
              return _buildCompass(angle, context);
            },
          ),
        );
      },
    );
  }

  Future<bool?> _checkCompassSupport() async {
    try {
      return await FlutterQiblah.androidDeviceSensorSupport();
    } catch (e) {
      return false;
    }
  }

  Widget _buildCompass(double angle, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform.rotate(
          angle: angle,
          child: SvgPicture.asset(
            'assets/qiblah/5.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        _kaabaSvg,
        SvgPicture.asset(
          'assets/qiblah/3.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Align both arrow head\nDo not put device close to metal object.\nCalibrate the compass every time you use it.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/qiblah/5.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            'assets/qiblah/4.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            'assets/qiblah/3.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Preparing compass...\nPlease wait...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalibrationWarning(BuildContext context, dynamic error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning, size: 50, color: Colors.orange),
          const SizedBox(height: 20),
          Text(
            "Compass Issue",
            // style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Text(
            error.toString().contains('unreliable')
                ? "Please calibrate your compass by moving your device in a figure-8 motion"
                : "Compass error: ${error.toString()}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FlutterQiblah().dispose();
              FlutterQiblah.qiblahStream;
            },
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  Widget _buildUnsupportedDevice(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.device_unknown, size: 50, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            "Device Not Supported",
            // style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          const Text(
            "Your device doesn't have a compass sensor\nor it's not functioning properly.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }
}

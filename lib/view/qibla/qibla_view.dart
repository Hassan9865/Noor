import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:noor/view/qibla/custom_compass.dart';
import 'package:noor/view/qibla/qibla_viewModel.dart';
import 'package:stacked/stacked.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QiblaViewModel>.reactive(
      viewModelBuilder: () => QiblaViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Qibla Compass'), centerTitle: true),
          body: _buildBody(model),
        );
      },
    );
  }

  Widget _buildBody(QiblaViewModel model) {
    if (model.isBusy) {
      return const Center(child: CircularProgressIndicator());
    }

    if (model.hasError) {
      return Center(
        child: Text(model.errorMessage ?? 'Unknown error occurred'),
      );
    }

    // if (!model.locationEnabled) {
    //   return LocationErrorWidget(
    //     error: "Please enable Location service",
    //     callback: model.checkLocationStatus,
    //   );
    // }

    // Handle the LocationStatus object directly
    if (model.locationStatus != null) {
      final status = model.locationStatus!;

      // if (_isPermissionDenied(status.status)) {
      //   return LocationErrorWidget(
      //     error: _getErrorMessage(status.status),
      //     callback: model.checkLocationStatus,
      //   );
      // }

      if (status.enabled &&
          (status.status == LocationPermission.whileInUse ||
              status.status == LocationPermission.always)) {
        return CompassWidget();
      }
    }

    return Container();
  }

  // bool _isPermissionDenied(dynamic status) {
  //   return status == LocationPermission.denied ||
  //       status == LocationPermission.deniedForever;
  // }

  // String _getErrorMessage(dynamic status) {
  //   switch (status) {
  //     case LocationPermission.denied:
  //       return "Location service permission denied";
  //     case LocationPermission.deniedForever:
  //       return "Location service Denied Forever!";
  //     default:
  //       return "Unknown location error";
  //   }
  // }
}

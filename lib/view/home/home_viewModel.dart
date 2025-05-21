import 'package:noor/app/app.locator.dart';
import 'package:noor/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeviewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToQiblaview() {
    _navigationService.navigateToQiblaView();
  }

  navigateToPrayertime() {
    _navigationService.navigateToPrayerTimeView();
  }

  navigateToTasbhih() {
    _navigationService.navigateToTasbihView();
  }

  navigateToDua() {
    _navigationService.navigateToDuaView();
  }

  navigateToQuran() {
    _navigationService.navigateToQuranView();
  }

  navigateToZakat() {
    _navigationService.navigateToZakatView();
  }

  navigateToKalma() {
    _navigationService.navigateToKalmaView();
  }
}

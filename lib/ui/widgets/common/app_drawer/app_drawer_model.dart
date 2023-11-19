import 'package:stacked/stacked.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/app/app.logger.dart';

import 'package:stacked_services/stacked_services.dart';

class AppDrawerModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _logger = getLogger('App_Drawer');

  bool _currentThemeValue = false;

  bool get currentThemeValue => _currentThemeValue;

  void setCurrentTheme(bool value) {
    _logger.d(value);
    _currentThemeValue = value;
    rebuildUi();
  }

  void navigateToHome() {
    _navigationService.back();
  }

  void navigateToHomefromNewDish() {
    _navigationService.popRepeated(2);
  }
}

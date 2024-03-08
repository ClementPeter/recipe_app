import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/data_model/login_response.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:receipe_app/services/event_service.dart';
import 'package:receipe_app/services/secure_storage_service.dart';
import 'package:receipe_app/services/dio_service.dart';
import 'package:receipe_app/services/authentication_service.dart';
import 'package:receipe_app/services/dish_service.dart';
import 'package:receipe_app/services/database_service.dart';
import 'package:receipe_app/services/user_service.dart';
import 'package:receipe_app/services/localiazation_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EventService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DioService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DishService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DatabaseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocaliazationService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterEventService();
  getAndRegisterSecureStorageService();
  getAndRegisterDioService();
  getAndRegisterAuthenticationService();
  getAndRegisterDishService();
  getAndRegisterDatabaseService();
  getAndRegisterUserService();
  getAndRegisterLocaliazationService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockEventService getAndRegisterEventService() {
  _removeRegistrationIfExists<EventService>();
  final service = MockEventService();
  locator.registerSingleton<EventService>(service);
  return service;
}

MockSecureStorageService getAndRegisterSecureStorageService() {
  _removeRegistrationIfExists<SecureStorageService>();
  final service = MockSecureStorageService();
  locator.registerSingleton<SecureStorageService>(service);
  return service;
}

MockDioService getAndRegisterDioService() {
  _removeRegistrationIfExists<DioService>();
  final service = MockDioService();
  locator.registerSingleton<DioService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();

  when(service.login()).thenAnswer((_) => Future.value(LoginResponse()));

  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockDishService getAndRegisterDishService() {
  _removeRegistrationIfExists<DishService>();
  final service = MockDishService();
  locator.registerSingleton<DishService>(service);
  return service;
}

MockDatabaseService getAndRegisterDatabaseService() {
  _removeRegistrationIfExists<DatabaseService>();
  final service = MockDatabaseService();
  locator.registerSingleton<DatabaseService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

MockLocaliazationService getAndRegisterLocaliazationService() {
  _removeRegistrationIfExists<LocaliazationService>();
  final service = MockLocaliazationService();
  locator.registerSingleton<LocaliazationService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

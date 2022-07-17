// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authService.dart';
import '../services/dataPassingService.dart';
import '../services/databaseService.dart';
import '../services/firebaseAuth.dart';
import '../services/firebaseStore.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthentication());
  locator.registerLazySingleton<DatabaseService>(() => FirebaseStore());
  locator.registerLazySingleton(() => DataPassingService());
}
